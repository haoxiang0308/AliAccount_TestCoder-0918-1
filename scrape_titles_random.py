import requests
from bs4 import BeautifulSoup
import random
import string

def generate_random_filename(length=8):
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(length))
    return f"{random_name}.py"

def scrape_page_title(url):
    """Scrape the title of a webpage"""
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        
        soup = BeautifulSoup(response.content, 'html.parser')
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
    except Exception as e:
        return f"Error: {str(e)}"

def main():
    # Example URLs to scrape (more accessible ones)
    urls = [
        "https://httpbin.org/html",
        "https://www.google.com",
        "https://www.python.org",
        "https://github.com"
    ]
    
    print("Scraping page titles:")
    print("-" * 40)
    
    for url in urls:
        title = scrape_page_title(url)
        print(f"{url}: {title}")
    
    # Generate a random filename
    random_filename = generate_random_filename()
    print(f"\nRandom filename generated: {random_filename}")

if __name__ == "__main__":
    main()