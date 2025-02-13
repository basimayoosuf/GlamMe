from django.db import models
from artist.models import Artist

# Create your models here.
class PreviousWork(models.Model):
    previous_work_id = models.AutoField(primary_key=True)
    image = models.CharField(max_length=500)
    # artist_id = models.IntegerField()
    artist=models.ForeignKey(Artist,on_delete=models.CASCADE)

    class Meta:
        managed = False
        db_table = 'previous_work'

