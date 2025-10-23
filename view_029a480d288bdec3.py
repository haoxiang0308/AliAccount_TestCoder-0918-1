from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A Django view that renders a template
    """
    context = {
        'title': 'Sample Page',
        'message': 'Welcome to our Django application!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    return render(request, 'sample_template.html', context)

# Alternative view with basic HttpResponse
def simple_view(request):
    """
    A simple Django view returning an HttpResponse
    """
    return HttpResponse("Hello, Django!")