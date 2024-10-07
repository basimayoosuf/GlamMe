from django.db import models
from booking.models import Booking
from user.models import User
# Create your models here.
class Rating(models.Model):
    rating_id = models.AutoField(primary_key=True)
    rating = models.CharField(max_length=45)
    # booking_id = models.IntegerField()
    booking = models.ForeignKey(Booking, on_delete=models.CASCADE)
    # user_id = models.IntegerField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    feedback = models.CharField(max_length=200)

    class Meta:
        managed = False
        db_table = 'rating'

