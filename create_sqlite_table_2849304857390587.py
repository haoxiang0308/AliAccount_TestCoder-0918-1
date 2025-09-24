import sqlite3

# Connect to a new database file (or create it if it doesn't exist)
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()

# Define the SQL command to create a table
create_table_sql = '''
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    age INTEGER
);
'''

# Execute the SQL command
cursor.execute(create_table_sql)

# Commit the changes and close the connection
conn.commit()
conn.close()

print("SQLite table 'users' created successfully.")