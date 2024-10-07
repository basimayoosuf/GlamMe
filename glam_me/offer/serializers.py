from rest_framework import serializers
from offer.models import Offer


class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model = Offer
        fields = '__all__'
