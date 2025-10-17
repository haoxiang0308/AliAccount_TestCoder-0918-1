from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    "
    A sample Django view that renders a template.
    "
    context = {
        'title': 'Sample Page',
        'message': 'Welcome to our Django application!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    return render(request, 'sample_template.html', context)

# Alternative view example with more functionality
def another_view(request):
    "
    Another example view with additional functionality.
    "
    if request.method == 'POST':
        # Handle POST request
        pass
    else:
        # Handle GET request
        context = {
            'page_title': 'Another Page',
            'content': 'This is another example view.'
        }
        return render(request, 'another_template.html', context)
