from django.shortcuts import render

def my_view(request):
    # Sample context data
    context = {
        'title': 'My Django View',
        'message': 'Hello from the Django view!',
    }
    # Render the template with context
    return render(request, 'my_template.html', context)