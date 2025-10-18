#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script scrapes page titles from URLs using BeautifulSoup.
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
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.content, 'html.parser')
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
    except requests.RequestException as e:
        return f"Error fetching URL: {e}"
    except Exception as e:
        return f"Error parsing page: {e}"

def generate_random_filename():
    """
    Generate a random Python filename
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    # Example URLs to scrape
    urls = [
        "https://httpbin.org/html",
        "https://example.com",
        "https://httpbin.org/robots.txt"  # This won't have a title
    ]
    
    print("Scraping page titles...")
    for url in urls:
        title = scrape_page_title(url)
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 50)
    
    # If you want to scrape a specific URL, uncomment and modify the following:
    # url = input("Enter URL to scrape: ")
    # title = scrape_page_title(url)
    # print(f"Title of {url}: {title}")

if __name__ == "__main__":
    main()