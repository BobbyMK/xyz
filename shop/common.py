def calc_final_price(price, sale):
    # вычисляем цену с учетом скидки
    return price * (100 - sale) // 100


def generate_vendor_code() -> str:
    """
    Генерируем случайный уникальный артикул из 8 символов
    """

    from shop.models import Product
    import random
    import string

    chars = string.ascii_uppercase + string.ascii_letters + string.digits
    vendor_code = ''.join(random.choice(chars) for i in range(8))
    
    try:
        Product.objects.get(vendor_code=vendor_code)
    except Product.DoesNotExist:
        return vendor_code
    
    generate_vendor_code()

def get_sale_value():
    from django.conf import settings
    # Читаем размер скидки из файла
    with open(settings.SALE_VALUE, 'r') as f:
        sale = int(f.read())
    return sale