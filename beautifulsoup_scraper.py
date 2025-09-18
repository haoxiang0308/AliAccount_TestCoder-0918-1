"""
BeautifulSoup Web Scraper
This script demonstrates how to use BeautifulSoup to scrape page titles from websites.
It also shows how to generate random filenames.
"""

import requests
from bs4 import BeautifulSoup
import random
import string

def generate_random_filename(length=8):
    """
    Generate a random filename with .py extension
    
    Args:
        length (int): Length of the random part of the filename
        
    Returns:
        str: Random filename with .py extension
    """
    chars = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(chars) for _ in range(length))
    return f"{random_name}.py"

def scrape_page_title(url):
    """
    Scrape the title of a webpage
    
    Args:
        url (str): URL of the webpage to scrape
        
    Returns:
        str: Title of the webpage or error message
    """
    try:
        # Add headers to avoid being blocked by some websites
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        response = requests.get(url, timeout=10, headers=headers)
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
    # Example URLs to scrape
    urls = [
        "https://www.python.org",
        "https://www.github.com",
        "https://stackoverflow.com",
        "https://www.wikipedia.org"
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