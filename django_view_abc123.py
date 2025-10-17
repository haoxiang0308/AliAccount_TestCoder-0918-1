from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A sample Django view that renders a template.
    """
    context = {
        'title': 'Sample Page',
        'content': 'This is a sample page rendered by a Django view.',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with context
    return render(request, 'sample_template.html', context)

# Alternative view example with more functionality
def detail_view(request, item_id=None):
    """
    A Django view with parameters that renders a template.
    """
    # Simulate getting data based on item_id
    item_data = {
        'id': item_id,
        'name': f'Item {item_id}' if item_id else 'Unknown Item',
        'description': 'This is a detailed view of the item.'
    }
    
    context = {
        'item': item_data,
        'title': f'Detail View - {item_data["name"]}'
    }
    
    return render(request, 'detail_template.html', context)