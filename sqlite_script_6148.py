import sqlite3
import random
import string

# Generate a random table name
def random_table_name():
    return 'table_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

# Connect to SQLite database (it will be created if it doesn't exist)
conn = sqlite3.connect('example.db')
cursor = conn.cursor()

# Generate a random table name
table_name = random_table_name()

# SQL command to create a table with a random name
create_table_sql = f'''
CREATE TABLE IF NOT EXISTS {table_name} (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER
);
'''

# Execute the SQL command
cursor.execute(create_table_sql)

# Commit the changes and close the connection
conn.commit()
conn.close()

print(f"SQLite table '{table_name}' created successfully in 'example.db'.")