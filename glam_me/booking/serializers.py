from rest_framework import serializers
from booking.models import Booking


class android_serialiser(serializers.ModelSerializer):
  service=serializers.CharField(source='artistservice.service.service')
  user=serializers.CharField(source='user.username')


  class Meta:
      model = Booking
      fields = ['artistservice','user','booking_id','date','time','status','service','rate','suggestion']
