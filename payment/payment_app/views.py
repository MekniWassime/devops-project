from django.shortcuts import render
from django.views.generic import UpdateView
from rest_framework import viewsets, generics, mixins, status
from .serializers import PaymentSerializer
from rest_framework.response import Response
from .models import Payment
from rest_framework.throttling import AnonRateThrottle
import requests


class PaymentList(mixins.ListModelMixin, generics.GenericAPIView):
    queryset = Payment.objects.all()
    serializer_class = PaymentSerializer
    throttle_classes = [AnonRateThrottle]

    def get(self, request, *args, **kwargs):
        return self.list(request)

    def post(self, request, *args, **kwargs):
        serializer = PaymentSerializer(data=request.data)
        if serializer.is_valid():
            # Mock validate payment from external service
            validation_response = requests.get(
                'https://v2.jokeapi.dev/joke/Any?safe-mode')
            if(validation_response.ok):
                validation_data = validation_response.json()
                print(f"\"setup\": {validation_data['setup']}, \
                       \"delivery\": {validation_data['delivery']}")
                serializer.save()
                return Response(serializer.data)
            else:
                return Response({"message": "Could not verify payment"}, status=status.HTTP_402_PAYMENT_REQUIRED)
        else:
            return Response(serializer.errors)
