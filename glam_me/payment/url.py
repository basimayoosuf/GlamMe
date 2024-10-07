from django.conf.urls import url
from payment import views

urlpatterns = [
    url('managepayment/', views.managepayment),
    url('paid/(?P<idd>\w+)', views.paid),
    url('pending/(?P<idd>\w+)', views.pending),
    url('payment/', views.payment.as_view()),
    url('view_payment/',views.view_payment.as_view())

]