import random
import string
import os

# Generate a random filename
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
filename = f"{random_name}.py"

# The BeautifulSoup scraping script
script_content = '''import requests
from bs4 import BeautifulSoup

def scrape_page_title(url):
    """Scrape the title of a webpage"""
    try:
        response = requests.get(url)
        response.raise_for_status()
        soup = BeautifulSoup(response.content, 'html.parser')
        title = soup.title.string if soup.title else "No title found"
        return title.strip()
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
        print(f"{url} -> {title}")

if __name__ == "__main__":
    main()
'''

# Save to the randomly named file
with open(filename, 'w') as f:
    f.write(script_content)

print(f"Script saved to {filename}")