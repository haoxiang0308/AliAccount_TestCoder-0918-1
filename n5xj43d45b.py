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
            
            response = requests.get(url, timeout=10)
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
            
            print(f"Title for {url}: {title}")
            
        except Exception as e:
            print(f"Error scraping {url}: {str(e)}")
            titles.append({
                'url': url,
                'title': f"Error: {str(e)}"
            })
    
    return titles

def generate_random_filename(extension=".py"):
    """
    Generate a random filename with the given extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"

def save_titles_to_file(titles, filename):
    """
    Save the scraped titles to a file
    """
    with open(filename, 'w', encoding='utf-8') as f:
        f.write("# Scraped Page Titles\n")
        f.write("page_titles = [\n")
        for title_info in titles:
            f.write(f"    {{'url': '{title_info['url']}', 'title': '{title_info['title']}'}},\n")
        f.write("]\n")
    
    print(f"Titles saved to {filename}")

if __name__ == "__main__":
    # Example URLs to scrape
    urls = [
        "https://example.com",
        "https://httpbin.org/html",
        "github.com"
    ]
    
    print("Starting to scrape page titles...")
    titles = scrape_page_titles(urls)
    
    # Generate a random filename for the output
    random_filename = generate_random_filename(".txt")  # Using .txt for the output file
    save_titles_to_file(titles, random_filename)
    
    # If you want to save this scraper script with a random name, you would do:
    random_script_name = generate_random_filename(".py")
    with open(__file__, 'r', encoding='utf-8') as original_file:
        script_content = original_file.read()
    
    with open(random_script_name, 'w', encoding='utf-8') as new_file:
        new_file.write(script_content)
    
    print(f"Scraper script saved to {random_script_name}")