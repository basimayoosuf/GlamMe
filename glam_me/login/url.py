from django.conf.urls import url
from login import views

urlpatterns = [
    url('login/', views.login),
    url('asdf/',views.login_flutter.as_view())
]