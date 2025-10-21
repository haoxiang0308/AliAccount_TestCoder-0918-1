#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script uses BeautifulSoup to scrape page titles from URLs.
"""

import requests
from bs4 import BeautifulSoup
import csv
import time
from urllib.parse import urljoin, urlparse

def scrape_page_title(url):
    """
    Scrape the title from a given URL.
    
    Args:
        url (str): The URL to scrape
        
    Returns:
        str: The page title or an error message
    """
    try:
        # Add scheme if missing
        if not urlparse(url).scheme:
            url = 'http://' + url
            
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
            
    except requests.exceptions.RequestException as e:
        return f"Error fetching URL: {str(e)}"
    except Exception as e:
        return f"Error parsing page: {str(e)}"

def scrape_multiple_pages(urls):
    """
    Scrape titles from multiple URLs.
    
    Args:
        urls (list): List of URLs to scrape
        
    Returns:
        list: List of dictionaries with URL and title
    """
    results = []
    
    for url in urls:
        print(f"Scraping: {url}")
        title = scrape_page_title(url)
        results.append({"URL": url, "Title": title})
        
        # Be respectful and don't overload servers
        time.sleep(1)
    
    return results

def save_to_csv(data, filename="scraped_titles.csv"):
    """
    Save scraped data to a CSV file.
    
    Args:
        data (list): List of dictionaries with scraped data
        filename (str): Name of the output CSV file
    """
    with open(filename, 'w', newline='', encoding='utf-8') as csvfile:
        fieldnames = ['URL', 'Title']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        
        writer.writeheader()
        for row in data:
            writer.writerow(row)

def main():
    # Example URLs to scrape
    urls = [
        "https://httpbin.org/html",  # Test page with HTML
        "https://example.com",       # Example domain
        "https://httpbin.org/robots.txt"  # This will likely not have a title
    ]
    
    print("Starting to scrape page titles...")
    results = scrape_multiple_pages(urls)
    
    # Print results
    print("\nScraped Results:")
    print("-" * 50)
    for result in results:
        print(f"URL: {result['URL']}")
        print(f"Title: {result['Title']}")
        print("-" * 50)
    
    # Save results to CSV
    save_to_csv(results)
    print(f"\nResults saved to scraped_titles.csv")

if __name__ == "__main__":
    main()