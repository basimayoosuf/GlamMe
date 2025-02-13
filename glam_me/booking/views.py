from django.http import HttpResponse
from django.shortcuts import render

from booking.models import Booking
import datetime
# Create your views here.

def booking(request):
    return render(request, 'booking/booking.html')

def managebooking(request):
    obj = Booking.objects.all().order_by('-booking_id')
    context = {
        'k' : obj
    }
    return render(request, 'booking/managebooking.html',context)


def vw_and_assign(request):
    obj = Booking.objects.filter(status='Approved')
    context = {
        'k' : obj
    }
    return render(request, 'booking/vw_booking_and_assign.html',context)


def approve(request, idd):
    obj = Booking.objects.get(booking_id=idd)
    obj.status = 'Approved'
    obj.save()
    return managebooking(request)

def reject(request, idd):
    obj = Booking.objects.get(booking_id=idd)
    obj.status = 'Rejected'
    obj.save()
    return managebooking(request)

def view_booking(request):
    obj = Booking.objects.all().order_by('-booking_id')
    context = {
        'c' : obj
    }
    return render(request, 'booking/view_booking.html',context)


from rest_framework.views import APIView, Response
from booking.serializers import android_serialiser

class bookingg(APIView):
    def post(self, request):
        obj = Booking()
        obj.artistservice_id=request.data['sid']
        obj.user_id=request.data['uid']
        obj.date=request.data['date']
        obj.time=request.data['time']
        obj.rate=request.data['amount']
        obj.status='pending'
        obj.suggestion=request.data['suggestion']


        obj.save()
        return HttpResponse('yes')

class view_mybooking(APIView):
    def post(self, request):
        uid=request.data['uid']
        obj = Booking.objects.filter(user_id=uid)

        booking = android_serialiser(obj, many=True)
        return Response(booking.data)


# class view_mybooking1(APIView):
#     def post(self, request):
#         uid=request.data['uid']
#         obj = Booking.objects.filter(user_id=uid)
#         booking = android_serialiser(obj, many=True)
#         return Response(booking.data)

