import requests
from bs4 import BeautifulSoup
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return random_name + ".py"

def scrape_page_title(url):
    """Scrape the title of a webpage"""
    try:
        response = requests.get(url)
        response.raise_for_status()
        soup = BeautifulSoup(response.content, 'html.parser')
        title = soup.find('title')
        return title.text if title else "No title found"
    except Exception as e:
        return f"Error scraping {url}: {str(e)}"

def main():
    # Example URLs to scrape
    urls = [
        "https://www.python.org",
        "https://www.github.com",
        "https://www.stackoverflow.com",
        "https://www.wikipedia.org"
    ]
    
    print("Scraping page titles:")
    print("-" * 50)
    
    for url in urls:
        title = scrape_page_title(url)
        print(f"{url}: {title}")

if __name__ == "__main__":
    # Generate random filename
    filename = generate_random_filename()
    print(f"Script will be saved as: {filename}")
    
    # Execute the main function
    main()