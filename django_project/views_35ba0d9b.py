from django.shortcuts import render
from django.http import HttpResponse

def my_template_view(request):
    """
    A Django view that renders a template with sample context data.
    """
    context = {
        'title': 'My Django Page',
        'message': 'Hello from Django!',
        'items': ['item1', 'item2', 'item3']
    }
    return render(request, 'my_template.html', context)

def simple_view(request):
    """
    A simple Django view that returns an HttpResponse.
    """
    return HttpResponse("This is a simple response from Django!")