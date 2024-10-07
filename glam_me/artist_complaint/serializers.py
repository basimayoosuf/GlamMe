from rest_framework import serializers
from artist_complaint.models import ArtistComplaint


class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model = ArtistComplaint
        fields = '__all__'
