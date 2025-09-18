import random
import string

def generate_random_filename(extension='.py'):
    """Generate a random filename with the given extension."""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"script_{random_chars}{extension}"

def main():
    # Generate random filename
    filename = generate_random_filename()
    
    # Define the Python function content
    function_content = '''def hello_world():
    print('Привет, мир!')

if __name__ == "__main__":
    hello_world()
'''
    
    # Write the content to the file
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(function_content)
    
    print(f"Файл {filename} успешно создан с функцией hello_world().")

if __name__ == "__main__":
    main()