import sqlite3
import random
import string

def create_random_table_name():
    """Generate a random table name"""
    letters = string.ascii_lowercase
    return 'table_' + ''.join(random.choice(letters) for i in range(8))

def create_sqlite_table():
    """Create a SQLite database and table"""
    # Generate a random database name
    db_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.db'
    
    # Connect to SQLite database (creates it if it doesn't exist)
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    
    # Generate a random table name
    table_name = create_random_table_name()
    
    # Create a sample table with id, name, and email columns
    create_table_query = f'''
    CREATE TABLE IF NOT EXISTS {table_name} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT UNIQUE,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )
    '''
    
    cursor.execute(create_table_query)
    
    # Commit changes and close connection
    conn.commit()
    print(f"Table '{table_name}' created successfully in database '{db_name}'")
    conn.close()

if __name__ == "__main__":
    create_sqlite_table()