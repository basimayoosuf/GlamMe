from django.db import models
from booking.models import Booking
from user.models import User

# Create your models here.
class Complaint(models.Model):
    complaint_id = models.AutoField(primary_key=True)
    complaint = models.CharField(max_length=500)
    # booking_id = models.IntegerField()
    booking = models.ForeignKey(Booking, on_delete=models.CASCADE)
    reply = models.CharField(max_length=200)
    # user_id = models.IntegerField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    date = models.DateField()
    time = models.TimeField()

    class Meta:
        managed = False
        db_table = 'complaint'

