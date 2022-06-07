"""xyz URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from re import template
from django.contrib import admin
from django.urls import path
from django.contrib.auth import views as auth_views
from django.conf import settings
from django.conf.urls.static import static

from shop.views import ProductList, OrderItemCreate, ItemsInCartList, OrderCreate, OrderList

urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', auth_views.LoginView.as_view(template_name='login.html'), name='login'),
    path('cart/', ItemsInCartList.as_view(), name='cart'),
    path('catalog/', ProductList.as_view(), name='catalog'),
    path('orders_list/', OrderList.as_view(), name='orders_list'),
    path('api/v1/item/create/', OrderItemCreate.as_view(), name='create_item'),
    path('api/v1/order/create/', OrderCreate.as_view(), name='create_order'),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)