import sqlite3

# Connect to the database
conn = sqlite3.connect('/workspace/rezfuqhc.db')
cursor = conn.cursor()

# Get table information
cursor.execute("PRAGMA table_info(users);")
columns = cursor.fetchall()

print("Table 'users' structure:")
print("Column ID | Name | Type | Not Null | Default Value | Primary Key")
print("-" * 65)
for column in columns:
    print(f"{column[0]:>9} | {column[1]} | {column[2]} | {column[3]} | {column[4]} | {column[5]}")

# Close connection
conn.close()