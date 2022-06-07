from rest_framework.views import APIView
from rest_framework import generics
from rest_framework.permissions import IsAuthenticated
from rest_framework.renderers import TemplateHTMLRenderer
from rest_framework.response import Response
from rest_framework import status
from django.core.exceptions import ValidationError
from django.db.models import Prefetch

from datetime import datetime
from shop.models import Product, Cart, OrderItem, Order
from shop.serializers import ProductSerializer, OrderItemSerializer
from shop.common import get_sale_value

class ProductList(generics.ListAPIView):

    serializer_class = ProductSerializer
    permission_classes = (IsAuthenticated,)
    renderer_classes = [TemplateHTMLRenderer]
    template_name = 'catalog.html'

    def get(self, request):
        queryset = Product.objects.filter(status='ONSALE')
        sale = get_sale_value()
        return Response({'products': queryset, 'sale': sale})


class OrderItemCreate(APIView):

    permission_classes = (IsAuthenticated,)
    def post(self, request):
        cart = Cart.objects.get_or_create(user=request.user)[0]
        product = Product.objects.get(vendor_code=request.data['vendor_code'])
        price = product.final_price
        sale = get_sale_value()
        try:
            item = OrderItem.objects.get(cart=cart, product=product)
        except OrderItem.DoesNotExist:
            item = OrderItem.objects.create(cart=cart, product=product, price=price, sale=sale)
        item.count += 1
        item.save()
        cart.total_amount += item.price
        cart.save()

        return Response(status=status.HTTP_201_CREATED)


class ItemsInCartList(generics.ListAPIView):

    permission_classes = (IsAuthenticated,)
    serializer_class = OrderItemSerializer
    renderer_classes = [TemplateHTMLRenderer]
    template_name = 'cart.html'

    def get(self, request):
        try:
            cart = Cart.objects.get(user=request.user)
        except Cart.DoesNotExist:
            raise ValidationError('У пользователя нет корзины')
        queryset = OrderItem.objects.filter(cart=cart).select_related('product')
        return Response({'items': queryset, 'cart': cart})


class OrderCreate(APIView):

    permission_classes = (IsAuthenticated,)
    def post(self, request):
        cart = Cart.objects.get(user=request.user)
        order = Order.objects.create(user=request.user, cost=cart.total_amount)
        for item in cart.items.all():
            item.order = order
            item.bought = True
            item.purchase_date = datetime.now()
            item.cart = None
            item.save()
        cart.total_amount = 0
        cart.save()
        return Response(status=status.HTTP_201_CREATED)


class OrderList(generics.ListAPIView):

    permission_classes = (IsAuthenticated,)
    serializer_class = OrderItemSerializer
    renderer_classes = [TemplateHTMLRenderer]
    template_name = 'orders_list.html'

    def get(self, request):
        order_qs = Order.objects.filter(user=request.user).order_by('-id').prefetch_related(
            Prefetch('items', to_attr='order_items')
        )
        return Response({'order_qs': order_qs})