from django.shortcuts import render

def home_view(request):
    context = {'greeting': 'Welcome to our Django site!'}
    return render(request, 'home.html', context)
