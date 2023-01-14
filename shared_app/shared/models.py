from django.db import models
from django.conf import settings


class Product(models.Model):
    label = models.CharField(max_length=100)
    image = models.ImageField(upload_to='products')
    description = models.TextField()
    quantity = models.PositiveIntegerField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    created = models.DateTimeField(auto_now_add=True)


class Category(models.Model):
    class Meta:
        verbose_name_plural = 'categories'
    label = models.CharField(max_length=100)


class Client(models.Model):
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    bought = models.ManyToManyField(
        to=Product, related_name='bought', through='BoughtProduct')


class Supplier(models.Model):
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    logo = models.ImageField(upload_to='logos')


class BoughtProduct(models.Model):
    quantity = models.PositiveIntegerField()
    date = models.DateTimeField(auto_now_add=True)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    client = models.ForeignKey(Client, on_delete=models.CASCADE)
