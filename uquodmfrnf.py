import requests
from bs4 import BeautifulSoup

def scrape_page_title(url):
    """Scrape the title of a webpage"""
    try:
        headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'}
        response = requests.get(url, headers=headers)
        response.raise_for_status()
        soup = BeautifulSoup(response.content, 'html.parser')
        title = soup.find('title')
        return title.text if title else "No title found"
    except Exception as e:
        return f"Error scraping {url}: {str(e)}"

def main():
    # Example URLs to scrape
    urls = [
        "https://www.python.org",
        "https://www.github.com",
        "https://www.stackoverflow.com",
        "https://www.wikipedia.org"
    ]
    
    print("Scraping page titles:")
    print("-" * 50)
    
    for url in urls:
        title = scrape_page_title(url)
        print(f"{url}: {title}")

if __name__ == "__main__":
    main()