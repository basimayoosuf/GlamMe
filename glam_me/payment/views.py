from django.http import HttpResponse
from django.shortcuts import render
from payment.models import Payment
# Create your views here.
def payment(request):
    return render(request, 'payment/payment.html')

def viewpayment(request):
    return render(request, 'payment/viewpayment.html')

def managepayment(request):
    obj = Payment.objects.all()
    context = {
        'j' : obj
    }
    return render(request, 'payment/managepayment.html',context)

def paid(request, idd):
    obj = Payment.objects.get(paymentid=idd)
    obj.status = 'Paid'
    obj.save()
    return managepayment(request)

def pending(request, idd):
    obj = Payment.objects.get(paymentid=idd)
    obj.status = 'Pending'
    obj.save()
    return managepayment(request)


from rest_framework.views import APIView, Response
from payment.serializers import android_serialiser


class payment(APIView):
    def post(self, request):
        obj = Payment()
        obj.amount=request.data['amount']
        obj.booking_id=1
        obj.method=request.data['method']
        obj.cvv=request.data['cvv']
        obj.cardholder_name=request.data['cardholder_name']
        obj.status='pending'

        obj.save()
        return HttpResponse('yes')


class view_payment(APIView):
    def get(self,request):
        obj=Payment.objects.all()
        pay=android_serialiser(obj,many=True)
        return Response(pay.data)
