from django.conf.urls import url
from rating import views

urlpatterns = [
    url('viewrating/', views.viewrating),
    url('rating/',views.rating.as_view())
]