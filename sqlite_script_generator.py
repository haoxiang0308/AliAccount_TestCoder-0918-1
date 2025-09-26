import sqlite3
import random
import string

def create_random_table():
    # Generate a random table name
    table_name = 'table_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    
    # Connect to SQLite database (creates it if it doesn't exist)
    conn = sqlite3.connect('example.db')
    cursor = conn.cursor()
    
    # Create table with random name
    create_table_sql = f'''
    CREATE TABLE IF NOT EXISTS {table_name} (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        value REAL
    );
    '''
    cursor.execute(create_table_sql)
    
    # Commit changes and close connection
    conn.commit()
    conn.close()
    
    print(f"Table '{table_name}' created successfully in 'example.db'.")

if __name__ == "__main__":
    create_random_table()
