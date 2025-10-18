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


def another_view(request):
    """
    Another example view with different template.
    """
    context = {
        'page_title': 'Another Page',
        'content': 'This is another page rendered with Django.'
    }
    
    return render(request, 'another_template.html', context)