from django.conf.urls import url
from assigned_work import views

urlpatterns = [
    url('assignedwork/', views.assignedwork),
    url('view_wrkstatus/', views.view_wrkstatus),
    url('view_assignedwork',views.view_assigned_work.as_view())
]