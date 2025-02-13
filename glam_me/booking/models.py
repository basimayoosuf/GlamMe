from django.db import models
from service.models import Artistservice
from user.models import User
from artist.models import Artist

# Create your models here.
class Booking(models.Model):
    booking_id = models.AutoField(primary_key=True)
    # artistservice_id = models.IntegerField()
    artistservice = models.ForeignKey(Artistservice, on_delete=models.CASCADE)
    # user_id = models.IntegerField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    date = models.DateField()
    time = models.TimeField()
    rate = models.IntegerField()
    status = models.CharField(max_length=45)
    suggestion = models.CharField(max_length=1000)


    class Meta:
        managed = False
        db_table = 'booking'


