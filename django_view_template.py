from django.shortcuts import render
from django.http import HttpResponse


def sample_view(request):
    """
    A Django view that renders a template.
    """
    # Context data to pass to the template
    context = {
        'title': 'Sample Page',
        'message': 'Hello from Django view!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with context
    return render(request, 'sample_template.html', context)


# Alternative view with additional logic
def another_view(request):
    """
    Another example of a Django view with more complex logic.
    """
    if request.method == 'POST':
        # Handle POST request
        pass
    
    # Prepare context for the template
    context = {
        'page_title': 'Dynamic Page',
        'user': request.user if request.user.is_authenticated else None,
        'data': {
            'name': 'Example Data',
            'count': 42
        }
    }
    
    return render(request, 'another_template.html', context)