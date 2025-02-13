from django.shortcuts import render
from notification.models import Notification
from user.models import User
from artist.models import Artist
import datetime
# Create your views here.

def notification(request):
    # ob=User.objects.all()
    ob1=Artist.objects.all()
    context={
        # 'x':ob,
        'y':ob1
    }
    if request.method == 'POST':
        obj = Notification()
        obj.notification = request.POST.get('ntfcn')
        obj.user_id = 1
        obj.artist_id = request.POST.get('uid')
        obj.date = datetime.datetime.today()
        obj.time = datetime.datetime.now()
        obj.type='artist'
        obj.save()
    return render(request, 'notification/notification.html', context)

def notificationuser(request):
    ob=User.objects.all()
    # ob1=Artist.objects.all()
    context={
        'x':ob,
        # 'y':ob1
    }
    if request.method == 'POST':
        obj = Notification()
        obj.notification = request.POST.get('ntfcn')
        obj.user_id =  request.POST.get('uid')
        obj.artist_id = 1
        obj.date = datetime.datetime.today()
        obj.time = datetime.datetime.now()
        obj.type='user'
        obj.save()
    return render(request, 'notification/notificationuser.html', context)


def view_notfctn(request):
    return render(request, 'notification/view_notfctn.html')





from rest_framework.views import APIView,Response
from notification.serializers import android_serialiser
class view_notification_artist(APIView):
    def post(self, request):
        uid = request.data['uid']
        obj = Notification.objects.filter(artist_id=uid)
        noti=android_serialiser(obj, many=True)
        return Response(noti.data)

class view_notification_user(APIView):
    def post(self, request):
        uid=request.data['uid']
        obj = Notification.objects.filter(user_id=uid)
        noti=android_serialiser(obj, many=True)
        return Response(noti.data)