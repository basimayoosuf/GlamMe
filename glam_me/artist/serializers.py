from rest_framework import serializers
from artist.models import Artist


class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model = Artist
        fields = '__all__'