from django.contrib import admin
from .models import Product, Category, Client, BoughtProduct, Supplier

admin.site.register(Product)
admin.site.register(Category)
admin.site.register(Client)
admin.site.register(BoughtProduct)
admin.site.register(Supplier)


# Register your models here.
