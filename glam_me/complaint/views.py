from django.http import HttpResponse
from django.shortcuts import render
from complaint.models import Complaint
import datetime
# Create your views here.

# def postcmplt(request):
#     return render(request, 'complaint/postcmplt.html')

def postreply(request, idd):
    obj = Complaint.objects.get(complaintid=idd)
    obj.reply =request.POST.get('reply')
    obj.save()
    # return viewcomplaint(request)
    return render(request, 'complaint/postreply.html')

def viewcomplaint(request):
    obj = Complaint.objects.all()
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
        obj = Complaint()
        obj.complaint= request.data['complaint']
        obj.booking_id=1
        obj.reply='pending'
        obj.user_id=1
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.save()
        return HttpResponse('yes')

class view_complaint(APIView):
    def get(self, request):
        obj = Complaint.objects.all()
        com = android_serialiser(obj, many=True)
        return Response(com.data)