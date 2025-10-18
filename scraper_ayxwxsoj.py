#!/usr/bin/env python3
"""
Web Page Title Scraper

This script scrapes page titles from a list of URLs using BeautifulSoup.
"""

import requests
from bs4 import BeautifulSoup
import csv
import time
from urllib.parse import urlparse


def scrape_page_title(url):
    """
    Scrape the title of a webpage from the given URL.
    
    Args:
        url (str): The URL of the webpage to scrape
        
    Returns:
        str: The title of the webpage, or an error message
    """
    try:
        # Add scheme if missing
        if not url.startswith(('http://', 'https://')):
            url = 'https://' + url
            
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Find the title tag
        title_tag = soup.find('title')
        if title_tag:
            title = title_tag.get_text().strip()
        else:
            title = "No title found"
            
        return title
    
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
        list: List of tuples containing (url, title)
    """
    results = []
    
    for i, url in enumerate(urls, 1):
        print(f"Scraping {i}/{len(urls)}: {url}")
        title = scrape_page_title(url)
        results.append((url, title))
        
        # Be respectful and add a small delay between requests
        time.sleep(1)
    
    return results


def save_results_to_csv(results, filename='scraped_titles.csv'):
    """
    Save the scraping results to a CSV file.
    
    Args:
        results (list): List of tuples containing (url, title)
        filename (str): Name of the output CSV file
    """
    with open(filename, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['URL', 'Title'])  # Header
        
        for url, title in results:
            writer.writerow([url, title])
    
    print(f"Results saved to {filename}")


def main():
    # Example URLs to scrape - replace with your own list
    urls_to_scrape = [
        'https://example.com',
        'https://httpbin.org/html',
        'https://www.python.org',
        'https://www.wikipedia.org'
    ]
    
    print("Starting web page title scraper...")
    results = scrape_multiple_pages(urls_to_scrape)
    
    print("\nScraping completed! Results:")
    print("-" * 50)
    for url, title in results:
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 50)
    
    # Save results to CSV
    save_results_to_csv(results)
    
    # Optionally, also save to a text file
    with open('scraped_titles.txt', 'w', encoding='utf-8') as f:
        for url, title in results:
            f.write(f"URL: {url}\n")
            f.write(f"Title: {title}\n")
            f.write("-" * 50 + "\n")
    
    print("Results also saved to scraped_titles.txt")


if __name__ == "__main__":
    main()