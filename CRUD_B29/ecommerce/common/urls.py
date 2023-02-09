from django.urls import path
from . import views

app_name='common'

urlpatterns = [
    path('master/',views.master, name="master"),
    path('home/',views.home, name="home"),
    path('seller-login/',views.seller_login, name="seller_login"),
    path('seller-registration/',views.seller_registration, name="seller_registration"),
    path('customer-login/',views.customer_login, name="customer_login"),
    path('customer-registration/',views.customer_registration, name="customer_registration"),
]