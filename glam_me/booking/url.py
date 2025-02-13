from django.conf.urls import url
from booking import views

urlpatterns = [
    url('managebooking/',views.managebooking),
    url('view_booking/',views.view_booking),
    url('approve/(?P<idd>\w+)', views.approve),
    url('reject/(?P<idd>\w+)', views.reject),
    url('booking/',views.bookingg.as_view()),
    url('myb/',views.view_mybooking.as_view()),
    url('ass_vw/',views.vw_and_assign),
    # url('mybooking/', views.view_mybooking1.as_view()),

]