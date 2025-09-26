import sqlite3
import random
import string
import os

def generate_random_filename():
  return ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

script_content = '''import sqlite3

# Connect to a new SQLite database (or open an existing one)
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()

# Create a table
cursor.execute(\"\"\"CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
)\"\"\")

# Commit the changes and close the connection
conn.commit()
conn.close()
'''

filename = generate_random_filename()
with open(filename, 'w') as f:
    f.write(script_content)

print(filename)