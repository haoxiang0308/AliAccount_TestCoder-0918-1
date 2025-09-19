import random
import string


def generate_random_filename(length=8, extension='.py'):
    """Generates a random filename with the specified extension."""
    letters_and_digits = string.ascii_letters + string.digits
    random_string = ''.join(random.choice(letters_and_digits) for _ in range(length))
    return random_string + extension


def hello_world():
    """Prints 'Привет, мир!' to the console."""
    print('Привет, мир!')


if __name__ == '__main__':
    # Generate a random filename
    filename = generate_random_filename()
    print(f'Generated filename: {filename}')

    # Write the function to a file with the random name
    with open(filename, 'w', encoding='utf-8') as f:
        f.write('def hello_world():\n')
        f.write("    print('Привет, мир!')\n\n")
        f.write("if __name__ == '__main__':\n")
        f.write('    hello_world()\n')

    print(f'Function saved to {filename}')
