import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_title(url):
    """
    Scrapes the title from a given URL.

    Args:
        url (str): The URL of the page to scrape.

    Returns:
        str: The title of the page, or an error message.
    """
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text(strip=True)
        else:
            return "Title tag not found"
    except requests.exceptions.RequestException as e:
        return f"Error fetching URL: {e}"
    except Exception as e:
        return f"An error occurred: {e}"

if __name__ == "__main__":
    # Example URL, replace with the target URL
    url_to_scrape = "https://example.com"  # A test page that usually has a title

    title = scrape_page_title(url_to_scrape)
    print(f"Scraped Title: {title}")

    # Generate a random filename
    random_filename = "scraped_title_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".txt"
    print(f"Saving title to {random_filename}...")

    with open(random_filename, 'w', encoding='utf-8') as f:
        f.write(title)

    print(f"Title saved successfully to {random_filename}.")
