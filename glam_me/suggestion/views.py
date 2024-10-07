from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from suggestion.models import Suggestion


def suggestion(request):
    return render(request, 'suggestion/suggestion.html')


from rest_framework.views import APIView, Response
from suggestion.serializers import android_serialiser


class suggestion(APIView):
    def post(self, request):
        obj = Suggestion()
        obj.suggestion=request.data['suggestion']
        obj.user_id=1

        obj.save()
        return HttpResponse('yes')

