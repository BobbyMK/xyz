import datetime

from django.db import models
from django.db.models import Prefetch
from django.conf import settings
from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver
from django.core.validators import MinValueValidator, MaxValueValidator

from shop.common import calc_final_price, generate_vendor_code, get_sale_value
from xyz.settings import SALE_VALUE


class SingletonModel(models.Model):
    class Meta:
        abstract = True
 
    def save(self, *args, **kwargs):
        self.__class__.objects.exclude(id=self.id).delete()
        super(SingletonModel, self).save(*args, **kwargs)
 
    @classmethod
    def load(cls):
        try:
            return cls.objects.get()
        except cls.DoesNotExist:
            return cls()


class Sale(SingletonModel):
    percent = models.PositiveSmallIntegerField(default=30, verbose_name='процент скидки',
        validators=[
            MinValueValidator(1,'Значение от 1 до 100'),
            MaxValueValidator(100,'Значение от 1 до 100')
        ])

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        with open(settings.SALE_VALUE, 'w') as f:
            f.write(str(self.percent))


class Product(models.Model):
    
    class StatusChoice(models.TextChoices):
        DRAFT = 'DRAFT', 'Черновик'
        ONSALE = 'ONSALE', 'В продаже'
        ARCHIVED = 'ARCHIVED', 'Архив'

    vendor_code = models.CharField(unique=True, max_length=100, verbose_name='Артикул')
    title = models.CharField(max_length=100, verbose_name='Наименование товара')
    image = models.ImageField(upload_to='img/', verbose_name='Обложка', blank=True, null=True)
    basic_price = models.IntegerField(verbose_name='Базовая цена')
    final_price = models.IntegerField(verbose_name='Итоговая цена', null=True) #Нужно ли как отдельное поле?
    status = models.CharField(max_length=20, default=StatusChoice.DRAFT,
        choices=StatusChoice.choices, verbose_name='Статус')
    monthly_sales = models.IntegerField(default=0, verbose_name='Продажи за 30 дней')
    monthly_cost = models.IntegerField(default=0, verbose_name='Cумма продажи за 30 дней')

    def __init__(self, *args, **kwargs):
        super(Product, self).__init__(*args, **kwargs)
        if not self.vendor_code:
            self.vendor_code = generate_vendor_code()
        if self.basic_price:
            self.final_price = calc_final_price(self.basic_price, get_sale_value())

    def __str__(self):
        return self.title


class Cart(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    total_amount = models.IntegerField(verbose_name='Общая цена', default=0)



class Order(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    cost = models.IntegerField(verbose_name='Цена')


class OrderItem(models.Model):
    product = models.ForeignKey(Product, on_delete=models.SET_NULL, null=True, related_name='items')
    cart = models.ForeignKey(Cart, on_delete=models.SET_NULL, null=True, related_name='items')
    order = models.ForeignKey(Order, on_delete=models.SET_NULL, null=True, related_name='items')
    count = models.PositiveSmallIntegerField(verbose_name='Количество', default=0)
    price = models.IntegerField(verbose_name='Цена')
    sale = models.PositiveSmallIntegerField(verbose_name='Скидка')
    bought = models.BooleanField(default=False, verbose_name='Куплен?')
    purchase_date = models.DateTimeField(verbose_name = 'Дата покупки', null = True, blank=True)
    
    @property
    def total_cost(self):
        return self.count * self.price


@receiver(post_save, sender=Sale)
def sale_post_save(sender, instance, **kwargs):
    for product in Product.objects.all():
        product.final_price = calc_final_price(product.basic_price, instance.percent)
        product.save()

@receiver(post_save, sender=Order)
def order_post_save(sender, instance, **kwargs):
    now = datetime.datetime.now()
    month_ago = now - datetime.timedelta(days=30)
    products = Product.objects.all().prefetch_related(
        Prefetch(
            'items',
            queryset=OrderItem.objects.filter(purchase_date__gte=month_ago),
            to_attr='product_items'
        )
    )
    for product in products:
        monthly_sales = 0
        monthly_cost = 0
        
        for item in product.product_items:
            monthly_sales += item.count
            monthly_cost += item.price
            
        product.monthly_sales = monthly_sales
        product.monthly_cost = monthly_cost
        product.save()
