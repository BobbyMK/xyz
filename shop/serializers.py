from itertools import product
from rest_framework import serializers

from shop.models import Product, Cart, OrderItem, Order

class ProductSerializer(serializers.ModelSerializer):

    class Meta:
        model = Product
        fields = ('__all__')

class OrderItemSerializer(serializers.ModelSerializer):

    class Meta:
        model = OrderItem
        fields = ('__all__')

