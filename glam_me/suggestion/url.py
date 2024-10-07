from django.conf.urls import url
from suggestion import views

urlpatterns = [
     url('suggestion/',views.suggestion.as_view())
]