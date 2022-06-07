from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from django.db.utils import ProgrammingError
from django.urls import reverse
from django.utils.html import format_html
 
from shop.models import Sale, Product, Order, OrderItem, Cart
 
 
class SaleAdmin(admin.ModelAdmin):
    def __init__(self, model, admin_site):
        super().__init__(model, admin_site)
        try:
            Sale.load().save()
        except ProgrammingError:
            pass
 
    # запрет на создание
    def has_add_permission(self, request, obj=None):
        return False
 
    # запрет на удаление
    def has_delete_permission(self, request, obj=None):
        return False
 

class ProductAdmin(admin.ModelAdmin):
    list_display = ["vendor_code", "title", "view_orders"]
    readonly_fields = ['view_orders', ]

    def view_orders(self, instance):
        order_items = OrderItem.objects.filter(product=instance, bought=True).values_list('order__id')
        orders = Order.objects.filter(id__in=order_items)
        links_string = ''
        for order in orders:
            url = reverse('admin:shop_order_change', args=(order.id,))
            links_string += f'<a href="{url}">Заказ №{order.id}</a>\n'
        return format_html(links_string)
    view_orders.short_description = "Часть заказа"


class OrderAdmin(admin.ModelAdmin):
    list_display = ["id", "user", "view_orderitems"]
    readonly_fields = ['view_orderitems', ]

    def view_orderitems(self, instance):
        items = instance.items.all().select_related('product')
        links_string = ''
        for item in items:
            url = reverse('admin:shop_orderitem_change', args=(item.id,))
            links_string += f'<a href="{url}">{item.product}({item.count}pcs)</a>\n'
        return format_html(links_string)
    view_orderitems.short_description = "Состав заказа"


class CustomUserAdmin(UserAdmin):
    list_display = ("username", "is_staff", "user_orders")
    readonly_fields = ("user_orders",)
    fieldsets = (
        (None, {"fields": ("username", "password")}),
        (("Personal info"), {"fields": ("first_name", "last_name", "email")}),
        (
            ("Permissions"),
            {
                "fields": (
                    "is_active",
                    "is_staff",
                    "is_superuser",
                ),
            },
        ),
        (("Important dates"), {"fields": ("last_login", "date_joined")}),
        (("Orders"), {"fields": ("user_orders",)}),
    )
    def user_orders(self, instance):
        orders = Order.objects.filter(user=instance)
        links_string = ''
        for order in orders:
            url = reverse('admin:shop_order_change', args=(order.id,))
            links_string += f'<a href="{url}">Заказ №{order.id}</a>\n'
        return format_html(links_string)
    user_orders.short_description = "Список заказов"


admin.site.register(Sale, SaleAdmin) 
admin.site.register(Cart) 
admin.site.register(Product, ProductAdmin) 
admin.site.register(Order, OrderAdmin) 
admin.site.register(OrderItem)
admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)