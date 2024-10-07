from rest_framework import serializers
from suggestion.models import Suggestion


class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model = Suggestion
        fields = '__all__'
