#!/usr/bin/env python3
"""
Web scraper to extract page titles from URLs using BeautifulSoup
"""

import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_title(url):
    """
    Scrape the title from a given URL
    """
    try:
        # Add headers to avoid being blocked by some websites
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Get the title tag
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
            
    except requests.exceptions.RequestException as e:
        return f"Error fetching URL: {e}"
    except Exception as e:
        return f"Error parsing page: {e}"

def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    # Example URLs to scrape
    urls = [
        "https://httpbin.org/html",
        "https://example.com",
        "https://httpbin.org/json"
    ]
    
    print("Scraping page titles...")
    for url in urls:
        title = scrape_page_title(url)
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 50)
    
    # Generate a random filename
    random_filename = generate_random_filename()
    print(f"Random filename generated: {random_filename}")

if __name__ == "__main__":
    main()