from django.shortcuts import render
from rest_framework import generics, mixins
from shared_app.models import Product


class PaymentList(mixins.ListModelMixin, generics.GenericAPIView):
    queryset = Payment.objects.all()
    serializer_class = PaymentSerializer
