#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script scrapes page titles from a list of URLs using BeautifulSoup.
"""

import requests
from bs4 import BeautifulSoup
import csv
import time
import random
from urllib.parse import urljoin, urlparse


def scrape_page_title(url):
    """
    Scrape the title of a webpage given its URL.
    
    Args:
        url (str): The URL to scrape
        
    Returns:
        str: The title of the page or an error message
    """
    try:
        # Add headers to avoid being blocked by some websites
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.text, 'html.parser')
        
        # Find the title tag
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
            
    except requests.exceptions.RequestException as e:
        return f"Error: {str(e)}"
    except Exception as e:
        return f"Error: {str(e)}"


def scrape_multiple_pages(urls):
    """
    Scrape titles from multiple URLs.
    
    Args:
        urls (list): List of URLs to scrape
        
    Returns:
        list: List of tuples containing (url, title)
    """
    results = []
    
    for i, url in enumerate(urls):
        print(f"Scraping {i+1}/{len(urls)}: {url}")
        title = scrape_page_title(url)
        results.append((url, title))
        
        # Be respectful and add a small delay between requests
        time.sleep(random.uniform(0.5, 1.5))
    
    return results


def save_to_csv(data, filename="scraped_titles.csv"):
    """
    Save scraped data to a CSV file.
    
    Args:
        data (list): List of tuples containing (url, title)
        filename (str): Name of the output CSV file
    """
    with open(filename, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['URL', 'Title'])  # Header row
        
        for url, title in data:
            writer.writerow([url, title])
    
    print(f"Data saved to {filename}")


def main():
    """
    Main function to demonstrate the web scraper.
    """
    # Example URLs to scrape - you can modify this list
    urls = [
        "https://httpbin.org/html",  # A test page with HTML content
        "https://example.com",
        "https://httpbin.org/robots.txt",  # This might not have a title
        "https://jsonplaceholder.typicode.com/",  # A JSON API, might not have a title
    ]
    
    print("Starting web scraping for page titles...")
    results = scrape_multiple_pages(urls)
    
    # Print results
    print("\nScraped Results:")
    print("-" * 60)
    for url, title in results:
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 60)
    
    # Save results to CSV
    save_to_csv(results)
    
    print("\nScraping completed!")


if __name__ == "__main__":
    main()