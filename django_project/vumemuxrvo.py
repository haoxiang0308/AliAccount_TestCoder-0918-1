from django.shortcuts import render
from django.http import HttpResponse

def home_view(request):
    """
    A simple view that renders a template
    """
    context = {
        'title': 'Welcome to My Django App',
        'message': 'This is a sample view rendering a template'
    }
    return render(request, 'home.html', context)

def about_view(request):
    """
    Another view example
    """
    return render(request, 'about.html', {
        'app_name': 'My Django Application'
    })
