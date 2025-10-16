from django.shortcuts import render
from django.http import HttpResponse

def sample_template_view(request):
    """
    A Django view that renders a template.
    """
    context = {
        'title': 'Sample Page',
        'message': 'Welcome to the sample page!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    return render(request, 'sample_template.html', context)

# Alternative view using HttpResponse for simple content
def simple_response_view(request):
    """
    A simple Django view returning an HTTP response.
    """
    html = """
    <html>
        <head><title>Simple Response</title></head>
        <body>
            <h1>Hello from Django!</h1>
            <p>This is a simple response view.</p>
        </body>
    </html>
    """
    return HttpResponse(html)