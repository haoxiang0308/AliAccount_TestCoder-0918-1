from django.shortcuts import render

def my_view(request):
    # Sample context data
    context = {
        'title': 'My Django Page',
        'message': 'Hello from Django!',
        'items': ['item1', 'item2', 'item3']
    }
    return render(request, 'my_template.html', context)