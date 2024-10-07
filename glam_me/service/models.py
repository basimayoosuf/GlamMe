from django.db import models
from artist.models import Artist
# Create your models here.
class Service(models.Model):
    service_id = models.AutoField(primary_key=True)
    # artist_id = models.IntegerField()
    artist = models.ForeignKey(Artist, on_delete=models.CASCADE)
    service = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'service'
