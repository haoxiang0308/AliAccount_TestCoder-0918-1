import sqlite3
import random
import string

# Generate a random table name
def random_table_name():
    return 'table_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

# Connect to SQLite database (or create it)
conn = sqlite3.connect('example.db')
cursor = conn.cursor()

# Get a random table name
table_name = random_table_name()
print(f"Creating table: {table_name}")

# Create the table
create_table_query = f'''
CREATE TABLE {table_name} (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    value REAL
);
'''

cursor.execute(create_table_query)

# Commit the changes and close the connection
conn.commit()
conn.close()

print("Table created successfully!")