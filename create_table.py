import sqlite3
import random
import string

# Generate a random table name
def random_table_name():
    return 'table_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

# Connect to SQLite database (it will be created if it doesn't exist)
conn = sqlite3.connect('example.db')
cursor = conn.cursor()

# Get a random table name
table_name = random_table_name()

# Create table SQL statement
create_table_sql = f'''
CREATE TABLE IF NOT EXISTS "{table_name}" (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER,
    email TEXT UNIQUE
);
'''

# Execute the SQL command
cursor.execute(create_table_sql)

# Commit the changes and close the connection
conn.commit()
conn.close()

print(f"Table '{table_name}' created successfully in 'example.db'.")