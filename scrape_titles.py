"""
A simple web scraper to extract page titles from a list of URLs using BeautifulSoup.
"""
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
        return f"Error fetching {url}: {e}"

def generate_random_filename(extension=".py"):
    """Generates a random filename."""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_string}{extension}"

if __name__ == "__main__":
    # Example URLs to scrape
    urls_to_scrape = [
        "https://httpbin.org/html", # This site provides simple HTML pages for testing
        "https://example.com",
        "https://www.python.org"
    ]

    print("Scraping page titles...")
    for url in urls_to_scrape:
        title = scrape_page_title(url)
        print(f"URL: {url}\nTitle: {title}\n")

    # Generate a random filename for demonstration (though we won't save the script again)
    random_filename = generate_random_filename(".py")
    print(f"A random filename was generated: {random_filename}")
    print("The script 'scrape_titles.py' has been created in the /workspace directory.")