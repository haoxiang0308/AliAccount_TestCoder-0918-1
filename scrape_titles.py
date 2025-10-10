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
    """Generates a random filename with the given extension."""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_string}{extension}"

if __name__ == "__main__":
    url = input("Enter the URL to scrape the title from: ")
    title = scrape_page_title(url)
    if title:
        filename = generate_random_filename()
        with open(filename, 'w') as f:
            f.write(f'# Scraped title from {url}\n')
            f.write(f'TITLE = "{title}"\n')
        print(f"Page title scraped and saved to {filename}")
    else:
        print("Failed to scrape the page title.")
