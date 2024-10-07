from django.db import models
from service.models import Service
from booking.models import Booking
from artist.models import  Artist
from user.models import  User
# Create your models here.

class AssignedWork(models.Model):
    # service_id = models.IntegerField()
    service = models.ForeignKey(Service, on_delete=models.CASCADE)
    # booking_id = models.IntegerField()
    booking = models.ForeignKey(Booking, on_delete=models.CASCADE)
    status = models.CharField(max_length=45)
    date = models.DateField()
    time = models.TimeField()
    assigned_id = models.AutoField(primary_key=True)
    # artist_id = models.IntegerField()
    artist = models.ForeignKey(Artist, on_delete=models.CASCADE)
    # user_id = models.IntegerField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    class Meta:
        managed = False
        db_table = 'assigned_work'
