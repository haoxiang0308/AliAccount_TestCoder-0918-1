import sqlite3
import os

def create_table():
    """
    Creates a SQLite database and a sample table with some data.
    """
    # Create a connection to the database (or create it if it doesn't exist)
    conn = sqlite3.connect('sample_database.db')
    
    # Create a cursor object to execute SQL commands
    cursor = conn.cursor()
    
    # Create a sample table (if it doesn't already exist)
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT UNIQUE NOT NULL,
            age INTEGER,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ''')
    
    # Insert some sample data
    sample_data = [
        ('Alice Johnson', 'alice@example.com', 30),
        ('Bob Smith', 'bob@example.com', 25),
        ('Charlie Brown', 'charlie@example.com', 35)
    ]
    
    cursor.executemany('''
        INSERT OR IGNORE INTO users (name, email, age) 
        VALUES (?, ?, ?)
    ''', sample_data)
    
    # Commit the changes and close the connection
    conn.commit()
    
    # Print confirmation
    print(f"Table 'users' created successfully in {os.path.abspath('sample_database.db')}")
    print(f"Number of records inserted: {cursor.rowcount}")
    
    # Show the data that was inserted
    cursor.execute("SELECT * FROM users")
    rows = cursor.fetchall()
    print("\nCurrent data in the table:")
    for row in rows:
        print(row)
    
    conn.close()

if __name__ == "__main__":
    create_table()