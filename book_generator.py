import xml.etree.ElementTree as ET
import random
import string
import os

def generate_random_filename(extension=".xml"):
    """Generates a random filename with the given extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"{random_string}{extension}"

def create_book_xml(title, author, isbn, output_dir="/workspace"):
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

    # Generate a random filename
    filename = generate_random_filename()

    # Create the full path
    full_path = os.path.join(output_dir, filename)

    # Create the tree and write to file
    tree = ET.ElementTree(root)
    tree.write(full_path, encoding="utf-8", xml_declaration=True)

    return full_path

if __name__ == "__main__":
    # Example book details
    book_title = "The Example Book"
    book_author = "Jane Doe"
    book_isbn = "978-3-16-148410-0"

    # Generate the XML file
    saved_file_path = create_book_xml(book_title, book_author, book_isbn)

    print(f"Book XML generated and saved to: {saved_file_path}")