import xml.etree.ElementTree as ET
import random
import string

def generate_random_filename():
    """Generates a random filename with a .xml extension."""
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(8))
    return f"{random_string}.xml"

def create_book_xml(title, author, isbn, filename):
    """Creates an XML file representing a book."""
    # Create the root element
    root = ET.Element("book")

    # Create child elements
    title_elem = ET.SubElement(root, "title")
    title_elem.text = title

    author_elem = ET.SubElement(root, "author")
    author_elem.text = author

    isbn_elem = ET.SubElement(root, "isbn")
    isbn_elem.text = isbn

    # Create the tree and write to file
    tree = ET.ElementTree(root)
    tree.write(filename, encoding="utf-8", xml_declaration=True)
    print(f"Book XML saved to {filename}")

if __name__ == "__main__":
    # Define book details
    book_title = "The Example Book"
    book_author = "Jane Doe"
    book_isbn = "978-0-123456-78-9"

    # Generate a random filename
    output_filename = generate_random_filename()

    # Create the XML file
    create_book_xml(book_title, book_author, book_isbn, output_filename)