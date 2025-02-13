from rest_framework import serializers
from rating.models import Rating


class android_serialiser(serializers.ModelSerializer):
    bid=serializers.CharField(source='booking.booking_id')
    class Meta:
        model = Rating
        fields = ['rating_id', 'bid', 'user_id', 'feedback']
