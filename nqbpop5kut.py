from django.shortcuts import render
from django.http import HttpResponse

def my_template_view(request):
    """
    A simple Django view that renders a template.
    """
    context = {
        'title': 'My Django View',
        'message': 'Hello from the Django template view!',
    }
    return render(request, 'my_template.html', context)

def another_view(request):
    """
    Another example view that renders a different template.
    """
    context = {
        'items': ['apple', 'banana', 'orange'],
        'user': {'name': 'John', 'age': 30}
    }
    return render(request, 'another_template.html', context)