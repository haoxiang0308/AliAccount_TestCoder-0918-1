import sqlite3
import random
import string

def generate_random_name(length=8):
    """Generate a random name for the database file"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for _ in range(length))

def create_table():
    # Generate a random database name
    db_name = generate_random_name() + ".db"
    
    # Connect to SQLite database (or create it if it doesn't exist)
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    
    # Create a sample table
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS employees (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            department TEXT NOT NULL,
            salary REAL
        )
    ''')
    
    # Insert sample data
    employees_data = [
        (1, 'John Doe', 'Engineering', 75000.00),
        (2, 'Jane Smith', 'Marketing', 65000.00),
        (3, 'Bob Johnson', 'Sales', 70000.00),
        (4, 'Alice Williams', 'HR', 60000.00)
    ]
    
    cursor.executemany('INSERT OR IGNORE INTO employees VALUES (?, ?, ?, ?)', employees_data)
    
    # Commit changes and close connection
    conn.commit()
    
    # Print the data to verify
    cursor.execute('SELECT * FROM employees')
    rows = cursor.fetchall()
    print(f"Data in {db_name}:")
    for row in rows:
        print(row)
    
    conn.close()
    print(f"Database '{db_name}' created successfully with employees table.")

if __name__ == "__main__":
    create_table()