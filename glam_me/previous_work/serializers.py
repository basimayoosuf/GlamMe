from rest_framework import serializers
from previous_work.models import PreviousWork


class android_serialiser(serializers.ModelSerializer):
    artname = serializers.CharField(source='artist.artistname')
    class Meta:
        model = PreviousWork
        fields = ['previous_work_id','image','artname']
