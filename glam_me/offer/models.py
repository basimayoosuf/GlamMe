from django.db import models
from service.models import Service
from artist.models import Artist


# Create your models here.
class Offer(models.Model):
    offer_id = models.AutoField(primary_key=True)

    service=models.CharField(max_length=45)
    offer = models.CharField(max_length=45)
    offerdate = models.CharField(max_length=45)
    # artist_id = models.IntegerField()
    artist = models.ForeignKey(Artist, on_delete=models.CASCADE)

    class Meta:
        managed = False
        db_table = 'offer'
