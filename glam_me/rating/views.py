from django.http import HttpResponse
from django.shortcuts import render
from rating.models import Rating
# Create your views here.

def rating(request):
    return render(request, 'rating/rating.html')

def viewrating(request):
    obj = Rating.objects.all()
    context = {
        'e' : obj
    }
    return render(request, 'rating/viewrating.html',context)


from rest_framework.views import APIView, Response
from rating.serializers import android_serialiser


class rating(APIView):
    def post(self, request):
        obj = Rating()
        obj.rating=request.data['rating']
        obj.booking_id=1
        obj.user_id=1
        obj.feedback=request.data['feedback']
        obj.save()
        return HttpResponse('yes')

