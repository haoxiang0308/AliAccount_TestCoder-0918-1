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

def generate_random_filename(extension=".py"):
    """Generates a random filename."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}{extension}"

if __name__ == "__main__":
    # Example URL, replace with the target URL
    url_to_scrape = "https://httpbin.org/html"  # A test page that usually has an HTML structure

    title = scrape_page_title(url_to_scrape)

    if title:
        random_filename = generate_random_filename()
        with open(random_filename, 'w') as f:
            f.write(f'Title of {url_to_scrape}: {title}\n')
        print(f"Title scraped and saved to {random_filename}")
    else:
        print("Could not scrape title.")