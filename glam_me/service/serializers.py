from rest_framework import serializers
from service.models import Service


class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model = Service
        fields = '__all__'
