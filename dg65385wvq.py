import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_titles(urls):
    """
    Scrape page titles from a list of URLs
    :param urls: List of URLs to scrape
    :return: List of tuples containing (URL, Title)
    """
    titles = []
    
    for url in urls:
        try:
            # Add protocol if missing
            if not url.startswith(('http://', 'https://')):
                url = 'https://' + url
            
            response = requests.get(url, timeout=10)
            response.raise_for_status()  # Raise an exception for bad status codes
            
            soup = BeautifulSoup(response.text, 'html.parser')
            title_tag = soup.find('title')
            
            if title_tag:
                title = title_tag.get_text().strip()
            else:
                title = "No title found"
            
            titles.append((url, title))
            print(f"Scraped: {url} -> {title}")
            
        except requests.RequestException as e:
            print(f"Error fetching {url}: {e}")
            titles.append((url, f"Error: {e}"))
        except Exception as e:
            print(f"Error parsing {url}: {e}")
            titles.append((url, f"Error: {e}"))
    
    return titles

def generate_random_filename(extension=".py"):
    """Generate a random filename with the given extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"

def main():
    # Example URLs to scrape
    urls = [
        "https://httpbin.org/html",  # Test page with HTML
        "https://example.com",
        "https://httpbin.org/json"   # This might not have a title
    ]
    
    print("Starting to scrape page titles...")
    results = scrape_page_titles(urls)
    
    print("\nResults:")
    for url, title in results:
        print(f"{url} -> {title}")

if __name__ == "__main__":
    main()