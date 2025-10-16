from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A Django view that renders a template.
    """
    context = {
        'title': 'Sample Page',
        'message': 'Welcome to our Django application!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with the context
    return render(request, 'sample_template.html', context)


def another_view(request):
    """
    Another example of a Django view that renders a template.
    """
    context = {
        'page_title': 'About Us',
        'about_content': 'This is the about page for our application.'
    }
    
    return render(request, 'about_template.html', context)