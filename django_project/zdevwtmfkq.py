from django.shortcuts import render
from django.http import HttpResponse

def my_template_view(request):
    """
    A Django view that renders a template
    """
    context = {
        'title': 'My Django Page',
        'message': 'Hello from Django!',
        'items': ['item1', 'item2', 'item3']
    }
    return render(request, 'my_template.html', context)

def alternative_view(request):
    """
    An alternative view that returns a simple HttpResponse
    """
    return HttpResponse("This is a simple response from Django!")