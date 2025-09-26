import mysql.connector
import uuid

# Generate a random file name
random_filename = f"query_result_{uuid.uuid4().hex}.txt"

# Configuration for database connection
config = {
    'user': 'your_username',
    'password': 'your_password',
    'host': '127.0.0.1',  # or your MySQL server host
    'database': 'your_database',
    'raise_on_warnings': True
}

# Establishing the connection
cnx = mysql.connector.connect(**config)
cursor = cnx.cursor()

# The SELECT query
query = "SELECT * FROM your_table LIMIT 5;"  # Example query, adjust as needed
cursor.execute(query)

# Fetch all results
results = cursor.fetchall()

# Get column names
column_names = [i[0] for i in cursor.description]

# Write results to the randomly named file
with open(random_filename, 'w') as f:
    # Write column headers
    f.write('\t'.join(column_names) + '\n')
    # Write rows
    for row in results:
        f.write('\t'.join(map(str, row)) + '\n')

print(f"Query results saved to {random_filename}")

# Close connections
cursor.close()
cnx.close()