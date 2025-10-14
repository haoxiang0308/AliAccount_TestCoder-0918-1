import sqlite3
import random
import string

# Generate a random table name
def random_table_name():
    return 'table_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

# Function to create the table
def create_table(db_name='example.db'):
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    
    table_name = random_table_name()
    
    # Create a sample table with id, name, and age columns
    create_table_sql = f'''
    CREATE TABLE IF NOT EXISTS {table_name} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER
    );
    '''
    
    cursor.execute(create_table_sql)
    conn.commit()
    conn.close()
    
    print(f"Table '{table_name}' created successfully in {db_name}.")

if __name__ == "__main__":
    create_table()