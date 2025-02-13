from django.shortcuts import render

def admin(request):
    return render(request, 'temp/admin.html')

def home(request):
    return render(request, 'temp/home.html')
