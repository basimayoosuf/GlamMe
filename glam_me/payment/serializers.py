from rest_framework import serializers
from payment.models import Payment


class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model = Payment
        fields = '__all__'
