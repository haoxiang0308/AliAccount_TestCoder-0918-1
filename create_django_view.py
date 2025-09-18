import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}.py"

def create_views_file():
    """Create a Django view that renders a template"""
    views_content = '''from django.shortcuts import render
from django.http import HttpResponse

def home_view(request):
    """
    A simple view that renders a template
    """
    context = {
        'title': 'Welcome to My Django App',
        'message': 'This is a sample view rendering a template'
    }
    return render(request, 'home.html', context)

def about_view(request):
    """
    Another view example
    """
    return render(request, 'about.html', {
        'app_name': 'My Django Application'
    })
'''
    
    # Generate random filename
    filename = generate_random_filename()
    filepath = os.path.join('django_project', filename)
    
    # Write the content to the file
    with open(filepath, 'w') as f:
        f.write(views_content)
    
    return filepath

if __name__ == "__main__":
    filepath = create_views_file()
    print(f"Django views file created: {filepath}")