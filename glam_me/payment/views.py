from django.http import HttpResponse
from django.shortcuts import render
from payment.models import Payment
# Create your views here.
def payment(request):
    return render(request, 'payment/payment.html')

def viewpayment(request):
    return render(request, 'payment/viewpayment.html')

def managepayment(request):
    obj = Payment.objects.all().order_by('-payment_id')
    context = {
        'j' : obj
    }
    return render(request, 'payment/managepayment.html',context)

def paid(request, idd):
    obj = Payment.objects.get(payment_id=idd)
    obj.status = 'Paid'
    obj.save()
    return managepayment(request)

def pending(request, idd):
    obj = Payment.objects.get(payment_id=idd)
    obj.status = 'Pending'
    obj.save()
    return managepayment(request)


from rest_framework.views import APIView, Response
from payment.serializers import android_serialiser


# class paymentt(APIView):
#     def post(self, request):
#         obj = Payment()
#         obj.amount=request.data['amount']
#         obj.booking_id=request.data['bid']
#         obj.artistamount=0
#         obj.method=request.data['method']
#         obj.cvv=request.data['cvv']
#         obj.cardholder_name=request.data['cardholder_name']
#         obj.status='pending'
#         obj.save()
#         return HttpResponse('yes')


class paymentt(APIView):
    def post(self, request):
        obj = Payment()

        # Convert the amount to a float before saving
        obj.amount = float(request.data['amount'])
        obj.booking_id = 1  # You can replace this with dynamic booking ID as needed
        obj.method = request.data['method']
        obj.cvv = request.data['cvv']
        obj.cardholder_name = request.data['cardholder_name']

        # Calculate the artist amount as 90% of the total amount
        obj.artistamount = obj.amount * 0.95  # 90% for the artist

        # Set the initial payment status to 'pending'
        obj.status = 'pending'

        # Save the payment object
        obj.save()

        return HttpResponse('yes')


class view_payment(APIView):
    def post(self,request):
        uid=request.data['uid']
        print("hello")
        print(uid)
        obj=Payment.objects.filter(booking__artistservice__artist_id=uid,status='paid')
        # obj=Payment.objects.filter(status='paid')
        pay=android_serialiser(obj,many=True)
        return Response(pay.data)
