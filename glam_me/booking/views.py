from django.http import HttpResponse
from django.shortcuts import render

from booking.models import Booking
import datetime
# Create your views here.

def booking(request):
    return render(request, 'booking/booking.html')

def managebooking(request):
    obj = Booking.objects.all()
    context = {
        'i' : obj
    }
    return render(request, 'booking/managebooking.html',context)

def approve(request, idd):
    obj = Booking.objects.get(bookingid=idd)
    obj.status = 'Approved'
    obj.save()
    return managebooking(request)

def reject(request, idd):
    obj = Booking.objects.get(bookingid=idd)
    obj.status = 'Rejected'
    obj.save()
    return managebooking(request)

def view_booking(request):
    obj = Booking.objects.all()
    context = {
        'c' : obj
    }
    return render(request, 'booking/view_booking.html',context)


from rest_framework.views import APIView, Response
from booking.serializers import android_serialiser

class booking(APIView):
    def post(self, request):
        obj = Booking()
        obj.service_id=1
        obj.user_id=1
        obj.date=request.data['date']
        obj.time=request.data['time']
        obj.status='pending'
        obj.save()
        return HttpResponse('yes')

