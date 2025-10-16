from django.shortcuts import render
from django.http import HttpResponse

def my_template_view(request):
    """
    A Django view that renders a template with context data.
    """
    context = {
        'page_title': 'My Django Page',
        'content': 'This is content passed from the view context.',
        'user_data': {
            'name': 'John Doe',
            'email': 'john@example.com'
        }
    }
    # Renders the template 'my_template.html' with the context
    return render(request, 'my_template.html', context)

def another_view(request):
    """
    Another example of a Django view rendering a template.
    """
    context = {
        'title': 'Welcome',
        'description': 'This is another example view'
    }
    return render(request, 'another_template.html', context)