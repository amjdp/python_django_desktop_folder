from django.shortcuts import render

# Create your views here.
def master(request):
    return render(request,'common/master.html')

def home(request):
    return render(request,'common/home.html')

def seller_login(request):
    return render(request,'common/seller_login.html')

def seller_registration(request):
    return render(request,'common/seller_registration.html')

def customer_login(request):
    return render(request,'common/customer_login.html')

def customer_registration(request):
    return render(request,'common/customer_registration.html')