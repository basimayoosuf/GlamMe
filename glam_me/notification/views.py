from django.shortcuts import render
from notification.models import Notification
import datetime
# Create your views here.

def notification(request):
    if request.method == 'POST':
        obj = Notification()
        obj.notification = request.POST.get('ntfcn')
        obj.date = datetime.datetime.today()
        obj.time = datetime.datetime.now()
        obj.save()
    return render(request, 'notification/notification.html')



def view_notfctn(request):
    return render(request, 'notification/view_notfctn.html')





from rest_framework.views import APIView,Response
from notification.serializers import android_serialiser
class view_notification(APIView):
    def get(self, request):
        obj=Notification.objects.all()
        noti=android_serialiser(obj, many=True)
        return Response(noti.data)