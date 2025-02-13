from rest_framework import serializers
from service.models import Artistservice
from service.models import Service


# class android_serialiser(serializers.ModelSerializer):
#     name=serializers.CharField(source='service.service')
#     class Meta:
#         model = Service
#         fields = '__all__'


class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model = Service
        fields = '__all__'


class android_serialiser1(serializers.ModelSerializer):
    artistname=serializers.CharField(source='artist.artistname')
    ser=serializers.CharField(source='service.service')
    image=serializers.CharField(source='artist.image')
    qualification=serializers.CharField(source='artist.qualification')
    e_mail= serializers.CharField(source='artist.e_mail')


    class Meta:
        model = Artistservice
        fields = ['artistservice_id', 'description', 'rate','artistname', 'ser','service', 'qualification', 'e_mail','image','artist_id']