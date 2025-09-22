#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script uses BeautifulSoup to scrape the title of a webpage.
"""

import requests
from bs4 import BeautifulSoup
import random
import string


def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"scraper_{random_chars}.py"


def scrape_page_title(url):
    """
    Scrape the title of a webpage.
    
    Args:
        url (str): The URL of the webpage to scrape
        
    Returns:
        str: The title of the webpage or an error message
    """
    # Add headers to mimic a real browser request
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
    }
    
    try:
        # Send GET request to the URL with headers
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Parse the HTML content
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Extract the title
        title = soup.title.string if soup.title else "No title found"
        return title.strip()
    
    except requests.RequestException as e:
        return f"Error fetching the webpage: {e}"
    except Exception as e:
        return f"Error parsing the webpage: {e}"


def main():
    """Main function to demonstrate the scraper"""
    # Example URLs to scrape
    urls = [
        "https://www.python.org",
        "https://www.github.com",
        "https://www.stackoverflow.com",
        "https://www.wikipedia.org"
    ]
    
    print("Web Page Title Scraper")
    print("=" * 30)
    
    for url in urls:
        print(f"\nURL: {url}")
        title = scrape_page_title(url)
        print(f"Title: {title}")


if __name__ == "__main__":
    # Generate and print a random filename (without creating the file)
    random_filename = generate_random_filename()
    print(f"This script could be saved as: {random_filename}")
    print()
    
    # Run the scraper demonstration
    main()