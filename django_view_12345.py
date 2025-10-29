from django.shortcuts import render
from django.http import HttpResponse

def sample_template_view(request):
    """
    A Django view that renders a template.
    """
    context = {
        'title': 'Sample Page',
        'content': 'This is a sample page rendered by a Django view.',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with context
    return render(request, 'sample_template.html', context)

# Alternative view with a different template
def another_view(request):
    """
    Another example of a Django view that renders a template.
    """
    context = {
        'page_title': 'Another Page',
        'message': 'Welcome to another page!'
    }
    
    return render(request, 'another_template.html', context)