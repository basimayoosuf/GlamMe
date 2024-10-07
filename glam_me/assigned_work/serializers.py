from rest_framework import serializers
from assigned_work.models import AssignedWork


class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model = AssignedWork
        fields = '__all__'
