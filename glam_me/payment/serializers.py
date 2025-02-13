from rest_framework import serializers
from payment.models import Payment


class android_serialiser(serializers.ModelSerializer):
    bid=serializers.CharField(source='booking.booking_id')

    class Meta:
        model = Payment
        fields = ['payment_id','amount','method','cvv','cardholder_name','bid']
