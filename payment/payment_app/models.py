from django.db import models
from django.core.validators import MinValueValidator
from rest_framework.serializers import CurrentUserDefault
from django.conf import settings


class Payment(models.Model):
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    amount = models.FloatField(validators=[MinValueValidator(
        0, message="payment needs to be positive")])
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user} {self.amount}"
