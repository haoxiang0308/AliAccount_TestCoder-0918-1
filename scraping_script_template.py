import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_titles(urls):
    """
    Scrape page titles from a list of URLs
    """
    titles = []
    
    for url in urls:
        try:
            # Add protocol if missing
            if not url.startswith(('http://', 'https://')):
                url = 'https://' + url
            
            response = requests.get(url)
            response.raise_for_status()  # Raise an exception for bad status codes
            
            soup = BeautifulSoup(response.content, 'html.parser')
            title_tag = soup.find('title')
            
            if title_tag:
                title = title_tag.get_text().strip()
            else:
                title = "No title found"
            
            titles.append({
                'url': url,
                'title': title
            })
            
            print(f"Scraped: {url} -> {title}")
            
        except requests.RequestException as e:
            print(f"Error fetching {url}: {e}")
            titles.append({
                'url': url,
                'title': f"Error: {e}"
            })
        except Exception as e:
            print(f"Error parsing {url}: {e}")
            titles.append({
                'url': url,
                'title': f"Error: {e}"
            })
    
    return titles

def generate_random_filename():
    """
    Generate a random Python filename
    """
    letters = string.ascii_lowercase + string.digits
    random_part = ''.join(random.choice(letters) for i in range(8))
    return f"scraped_titles_{random_part}.py"

def save_titles_to_file(titles, filename):
    """
    Save the scraped titles to a Python file
    """
    with open(filename, 'w', encoding='utf-8') as f:
        f.write("# Scraped Page Titles\n")
        f.write("page_titles = [\n")
        for item in titles:
            f.write(f"    {{'url': '{item['url']}', 'title': '{item['title']}'}},\n")
        f.write("]\n")
    
    print(f"Titles saved to {filename}")

def main():
    # Example URLs to scrape
    urls = [
        'https://httpbin.org/html',  # Test page with HTML
        'https://example.com',
        'https://httpbin.org/json'   # This will have no title
    ]
    
    print("Starting to scrape page titles...")
    titles = scrape_page_titles(urls)
    
    # Generate a random filename
    filename = generate_random_filename()
    save_titles_to_file(titles, filename)
    
    print("Scraping completed!")

if __name__ == "__main__":
    main()