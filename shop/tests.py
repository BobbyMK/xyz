from django.test import TestCase
from django.urls import reverse
from rest_framework.test import APIRequestFactory, force_authenticate
from django.contrib.auth.models import User
from shop.models import Product, Order, OrderItem, Cart
from shop.views import OrderItemCreate, OrderCreate

class TestPipeline(TestCase):
    def send_request(self, url, data, view, user):
        factory = APIRequestFactory()
        request = factory.post(url, data, format='json')
        force_authenticate(request, user=user)

        return view(request)


    #@pytest.mark.django_db
    def test_pipeline(self):
        """
        Проверяем весь пайплайн нашего приложения
        """
        user = User.objects.create(username='test_user', password='test_pword')
        prod = Product.objects.create(title='test', basic_price=1000, status='ONSALE')
        data = {'vendor_code' : prod.vendor_code}
        # Создаем OrderItem, Cart для юзера
        self.send_request(reverse('create_item'), data, OrderItemCreate.as_view(), user)
        # Проверяем соответствие последних созданных записей нашим ожиданиям
        cart = Cart.objects.last()
        item = OrderItem.objects.last()
        assert user == cart.user
        assert cart == item.cart
        # Создаем Order, очищаем корзину, помечаем OrderItem'ы как купленные
        self.send_request(reverse('create_order'), {}, OrderCreate.as_view(), user)

        order = Order.objects.last()
        item = OrderItem.objects.last()
        assert user == order.user
        assert order == item.order
        assert item.cart == None
        assert item.bought == True

