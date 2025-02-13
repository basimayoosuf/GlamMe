from django.http import HttpResponse
from django.shortcuts import render
from complaint.models import Complaint
import datetime
# Create your views here.

# def postcmplt(request):
#     return render(request, 'complaint/postcmplt.html')

def postreply(request, idd):
    if request.method=="POST":
        obj = Complaint.objects.get(complaint_id=idd)
        obj.reply =request.POST.get('reply')
        obj.save()
    # return viewcomplaint(request)
    return render(request, 'complaint/postreply.html')

def viewcomplaint(request):
    obj = Complaint.objects.all().order_by('-complaint_id')
    context = {
        'd': obj
    }
    return render(request, 'complaint/viewcomplaint.html',context)

def viewreplyuser(request):
    return render(request, 'complaint/viewreplyuser.html')


from rest_framework.views import APIView,Response
from complaint.serializers import android_serialiser

class complaint(APIView):
    def post(self,request):
        obj = Complaint.objects.get(complaint_id=request.data['cid'])
        obj.complaint=request.data['complaint']
        obj.booking_id=1
        obj.reply='pending'
        obj.user_id=request.data['uid']
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.save()
        return HttpResponse('yes')

class vw_reply(APIView):
    def post(self, request):
        uid=request.data['uid']
        obj = Complaint.objects.filter(user_id=uid)
        com = android_serialiser(obj, many=True)
        return Response(com.data)