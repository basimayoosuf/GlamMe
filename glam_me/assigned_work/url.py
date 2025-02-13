from django.conf.urls import url
from assigned_work import views

urlpatterns = [
    url('assignedwork/(?P<idd>\w+)', views.assignedwork),
    url('view_wrkstatus/', views.view_wrkstatus),
    url('abc/',views.view_assigned_work.as_view()),
    url('update/',views.update.as_view()),
    url('accept/',views.accept.as_view()),
    url('reject/',views.reject.as_view()),
    url('complete/',views.completed.as_view()),
    url('pending/',views.notcompleted.as_view())
]