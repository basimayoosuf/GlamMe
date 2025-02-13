from rest_framework import serializers
from offer.models import Offer


class android_serialiser(serializers.ModelSerializer):
    artname=serializers.CharField(source='artist.artistname')

    class Meta:
        model = Offer
        fields = ['offer_id','service','offer','offerdate','artname']
