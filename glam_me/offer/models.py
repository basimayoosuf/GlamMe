from django.db import models
from service.models import Service

# Create your models here.
class Offer(models.Model):
    offerid = models.AutoField(primary_key=True)
    # serviceid = models.IntegerField()
    service = models.ForeignKey(Service, on_delete=models.CASCADE)
    offer = models.CharField(max_length=45)
    offerdate = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'offer'
