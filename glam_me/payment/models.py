from django.db import models
from booking.models import Booking
# Create your models here.
class Payment(models.Model):
    payment_id = models.AutoField(primary_key=True)
    amount = models.FloatField()
    # booking_id = models.IntegerField()
    booking = models.ForeignKey(Booking, on_delete=models.CASCADE)
    method = models.CharField(max_length=20)
    cvv = models.CharField(max_length=10)
    cardholder_name = models.CharField(max_length=45)
    status = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'payment'

