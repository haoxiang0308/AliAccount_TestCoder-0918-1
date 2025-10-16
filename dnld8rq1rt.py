from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A Django view that renders a template.
    """
    # Context data to pass to the template
    context = {
        'title': 'Sample Page',
        'message': 'Welcome to our Django application!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with context
    return render(request, 'sample_template.html', context)

# Alternative view with a simple response
def hello_view(request):
    return HttpResponse("Hello, Django!")