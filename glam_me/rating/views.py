from django.http import HttpResponse
from django.shortcuts import render
from rating.models import Rating
# Create your views here.

def rating(request):
    return render(request, 'rating/rating.html')

def viewrating(request):
    obj = Rating.objects.all().order_by('-rating_id')
    context = {
        'e' : obj
    }
    return render(request, 'rating/viewrating.html',context)


from rest_framework.views import APIView, Response
from rating.serializers import android_serialiser


class ratingg(APIView):
    def post(self, request):
        obj = Rating()
        obj.rating=request.data['rating']
        obj.booking_id=request.data['bid']
        obj.user_id=request.data['uid']
        obj.feedback=request.data['feedback']
        obj.save()
        return HttpResponse('yes')

class view(APIView):
    def get(self,request):
        obj=Rating.objects.all()
        ser=android_serialiser(obj,many=True)
        return Response(ser.data)