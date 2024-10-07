from django.db import models
from booking.models import Booking
from artist.models import Artist
# Create your models here.
class ArtistComplaint(models.Model):
    artist_comp_id = models.AutoField(primary_key=True)
    complaint = models.CharField(max_length=500)
    # booking_id = models.IntegerField()
    booking = models.ForeignKey(Booking, on_delete=models.CASCADE)
    reply = models.CharField(max_length=200)
    # artist_id = models.IntegerField()
    artist = models.ForeignKey(Artist, on_delete=models.CASCADE)
    date = models.DateField()

    class Meta:
        managed = False
        db_table = 'artist_complaint'
