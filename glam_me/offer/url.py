from django.conf.urls import url
from offer import views

urlpatterns = [
     url('offer/',views.offer.as_view()),
     url('view_offer/',views.view_offer.as_view())
]