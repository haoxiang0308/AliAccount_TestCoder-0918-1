import sqlite3
import random
import string

def create_table():
    # Generate a random database filename
    db_name = 'database_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.db'
    
    # Connect to SQLite database (creates it if it doesn't exist)
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    
    # Create a sample table
    table_name = 'users_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=5))
    cursor.execute(f'''
        CREATE TABLE {table_name} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT UNIQUE,
            age INTEGER,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ''')
    
    print(f"Table '{table_name}' created successfully in database '{db_name}'")
    
    # Commit changes and close connection
    conn.commit()
    conn.close()

if __name__ == "__main__":
    create_table()