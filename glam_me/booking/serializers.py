from rest_framework import serializers
from booking.models import Booking


class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model = Booking
        fields = '__all__'
