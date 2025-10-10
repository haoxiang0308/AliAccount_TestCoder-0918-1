import sqlite3
import random
import string

# Generate a random filename
random_filename = 'script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Python script content
script_content = '''import sqlite3

def create_table():
    # Connect to SQLite database (or create it)
    conn = sqlite3.connect('example.db')
    cursor = conn.cursor()

    # Create a sample table
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT UNIQUE NOT NULL
        )
    """)

    # Commit changes and close the connection
    conn.commit()
    conn.close()

if __name__ == '__main__':
    create_table()
    print('Table created successfully.')
'''

# Write the script content to the randomly named file
with open(random_filename, 'w') as file:
    file.write(script_content)

print(random_filename)
