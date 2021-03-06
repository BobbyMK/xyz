# Generated by Django 4.0.4 on 2022-06-04 22:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0004_alter_product_final_price'),
    ]

    operations = [
        migrations.AddField(
            model_name='orderitem',
            name='price',
            field=models.IntegerField(default=0, verbose_name='Цена'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='orderitem',
            name='sale',
            field=models.PositiveSmallIntegerField(default=0, verbose_name='Скидка'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='cart',
            name='total_amount',
            field=models.IntegerField(default=0, verbose_name='Общая цена'),
        ),
    ]
