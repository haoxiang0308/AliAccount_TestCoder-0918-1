import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_title(url):
    """Scrapes the title from a given URL."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No Title Found"
    except requests.RequestException as e:
        print(f"Error fetching {url}: {e}")
        return None

def save_titles_to_file(titles, filename):
    """Saves a list of titles to a text file."""
    with open(filename, 'w', encoding='utf-8') as f:
        for title in titles:
            f.write(title + '\n')

def generate_random_filename(extension='txt'):
    """Generates a random filename."""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_string}.{extension}"

if __name__ == "__main__":
    # Example URLs to scrape
    urls = [
        'https://example.com',
        'https://httpbin.org/html', # This URL sometimes returns a 503 error
    ]

    titles = []
    for url in urls:
        title = scrape_page_title(url)
        if title:
            titles.append(f"{url}: {title}")
            print(f"Scraped: {title}")
        else:
            print(f"Failed to scrape title for {url}")

    # Generate a random filename and save the titles
    output_filename = generate_random_filename('txt')
    save_titles_to_file(titles, output_filename)
    print(f"Titles saved to {output_filename}")