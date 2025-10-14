import requests
from bs4 import BeautifulSoup

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
        return f"Error fetching URL: {e}"
    except Exception as e:
        return f"An error occurred: {e}"

if __name__ == "__main__":
    # Example usage
    url = "https://httpbin.org/html"  # A test page that usually has a title
    title = scrape_page_title(url)
    print(f"Title of {url}: {title}")