import requests
from bs4 import BeautifulSoup

def scrape_page_title(url):
    """
    Scrapes the title from a given URL.

    Args:
        url (str): The URL of the page to scrape.

    Returns:
        str: The title of the page, or None if not found or an error occurs.
    """
    try:
        # Send a GET request to the URL
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes (4xx or 5xx)

        # Create a BeautifulSoup object from the response content
        soup = BeautifulSoup(response.content, 'html.parser')

        # Find the title tag
        title_tag = soup.find('title')

        if title_tag:
            # Return the text content of the title tag, stripped of leading/trailing whitespace
            return title_tag.get_text().strip()
        else:
            # Return None if no title tag is found
            print(f"Warning: No <title> tag found on {url}")
            return None

    except requests.exceptions.RequestException as e:
        # Handle any errors during the request (e.g., network issues, invalid URL)
        print(f"Error fetching the URL {url}: {e}")
        return None
    except Exception as e:
        # Handle any other unexpected errors
        print(f"An unexpected error occurred while scraping {url}: {e}")
        return None

if __name__ == "__main__":
    # Example URL to scrape
    url_to_scrape = "https://httpbin.org/html"  # A test page that usually has a title

    title = scrape_page_title(url_to_scrape)

    if title:
        print(f"The title of the page '{url_to_scrape}' is: {title}")
    else:
        print(f"Could not retrieve the title for '{url_to_scrape}'.")
