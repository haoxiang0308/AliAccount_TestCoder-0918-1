import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_title(url):
    """Scrapes the title from a given URL."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text(strip=True)
        else:
            return "No title found"
    except requests.exceptions.RequestException as e:
        print(f"Error fetching {url}: {e}")
        return None

def main():
    # Example usage: scraping a single page
    url = 'https://httpbin.org/html'  # A test page that usually has a title
    title = scrape_page_title(url)
    if title:
        print(f"Title of {url}: {title}")

    # Generate a random filename
    random_filename = 'scraper_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'
    print(f"Saving script to {random_filename}")

    # Save this script to the random filename
    # This is a simplified version that just saves a basic script
    basic_script_content = '''import requests
from bs4 import BeautifulSoup

def scrape_page_title(url):
    \"\"\"Scrapes the title from a given URL.\"\"\"
    try:
        response = requests.get(url)
        response.raise_for_status()
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text(strip=True)
        else:
            return "No title found"
    except requests.exceptions.RequestException as e:
        print(f"Error fetching {url}: {e}")
        return None

# Example usage
url = 'https://example.com'
title = scrape_page_title(url)
if title:
    print(f"Title of {url}: {title}")
'''
    with open(random_filename, 'w') as f:
        f.write(basic_script_content)

    print(f"Script saved successfully to {random_filename}!")

if __name__ == "__main__":
    main()
