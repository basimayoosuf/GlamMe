from django.db import models
from service.models import Service
from booking.models import Booking
from artist.models import  Artist

# Create your models here.

class AssignedWork(models.Model):
    assigned_id = models.AutoField(primary_key=True)
    # booking_id = models.IntegerField()
    booking=models.ForeignKey(Booking,on_delete=models.CASCADE)
    status = models.CharField(max_length=45)
    date = models.DateField()
    time = models.TimeField()
    # artist_id = models.IntegerField()
    artist=models.ForeignKey(Artist,on_delete=models.CASCADE)

    class Meta:
        managed = False
        db_table = 'assigned_work'

