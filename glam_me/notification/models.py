from django.db import models
from user.models import User
from artist.models import Artist
# Create your models here.
class Notification(models.Model):
    notification_id = models.AutoField(primary_key=True)
    notification = models.CharField(max_length=500)
    date = models.DateField()
    time = models.TimeField()
    type = models.CharField(max_length=45, blank=True, null=True)
    # artist_id = models.IntegerField(blank=True, null=True)
    artist=models.ForeignKey(Artist, on_delete=models.CASCADE)
    # user_id = models.IntegerField(blank=True, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    class Meta:
        managed = False
        db_table = 'notification'


    def __str__(self):
        return self.notification
