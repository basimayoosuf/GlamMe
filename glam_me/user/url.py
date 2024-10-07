from django.conf.urls import url
from user import views

urlpatterns = [
    url('view_user/',views.view_user),
    url('user_reg/', views.user_reg.as_view())
]