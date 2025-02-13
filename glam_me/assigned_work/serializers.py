from rest_framework import serializers

import booking
from assigned_work.models import AssignedWork


class android_serialiser(serializers.ModelSerializer):
    bdate = serializers.CharField(source='booking.date')
    btime = serializers.CharField(source='booking.time')
    book = serializers.CharField(source='booking.booking_id')
    suggestion = serializers.CharField(source='booking.suggestion')

    class Meta:
        model = AssignedWork
        fields = ['assigned_id', 'bdate', 'btime', 'status', 'book', 'suggestion']
