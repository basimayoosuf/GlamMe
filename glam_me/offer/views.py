from django.http import HttpResponse
from django.shortcuts import render
from offer.models import Offer

# Create your views here.

def oo(request):
    return render(request, 'offer/offer.html')

def viewoffer(request):
    return render(request, 'offer/viewoffer.html')


from rest_framework.views import APIView, Response
from offer.serializers import android_serialiser


class offer(APIView):
    def post(self, request):
        obj = Offer()
        obj.service_id=1
        obj.offer=request.data['offer']
        obj.offerdate=request.data['offerdate']
        obj.save()
        return HttpResponse('yes')

class view_offer(APIView):
    def get(self, request):
        obj = Offer.objects.all()
        off = android_serialiser(obj, many=True)
        return Response(off.data)

