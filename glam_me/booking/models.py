from django.db import models
from service.models import Service
from user.models import User

# Create your models here.
class Booking(models.Model):
    booking_id = models.AutoField(primary_key=True)
    # service_id = models.IntegerField()
    service = models.ForeignKey(Service, on_delete=models.CASCADE)
    # user_id = models.IntegerField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    date = models.DateField()
    time = models.TimeField()
    status = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'booking'


