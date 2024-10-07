from django.conf.urls import url
from booking import views

urlpatterns = [
    url('managebooking/',views.managebooking),
    url('view_booking/',views.view_booking),
    url('approve/(?P<idd>\w+)', views.approve),
    url('reject/(?P<idd>\w+)', views.reject),
    url('booking/',views.booking.as_view())
]