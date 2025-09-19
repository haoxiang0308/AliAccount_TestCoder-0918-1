import sqlite3
import random
import string

def generate_random_name(length=8):
    """Generate a random name for the database file"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def create_table():
    # Generate a random database name
    db_name = generate_random_name()
    db_filename = f"{db_name}.db"
    
    # Connect to SQLite database (or create it if it doesn't exist)
    conn = sqlite3.connect(db_filename)
    cursor = conn.cursor()
    
    # Create a sample table
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        age INTEGER,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )
    ''')
    
    # Commit changes and close connection
    conn.commit()
    conn.close()
    
    print(f"Database '{db_filename}' created with table 'users'")

if __name__ == "__main__":
    create_table()