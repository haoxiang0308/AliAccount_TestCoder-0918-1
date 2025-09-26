import sqlite3

# Connect to a new SQLite database (or open an existing one)
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()

# Create a table
cursor.execute("""CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
)""")

# Commit the changes and close the connection
conn.commit()
conn.close()
