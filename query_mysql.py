import mysql.connector
import os
import uuid

# Generate a random filename for the output
output_filename = f"mysql_results_{uuid.uuid4().hex}.txt"

# Configuration for database connection
# These are placeholders and may need to be updated based on your specific setup
config = {
    'user': os.getenv('MYSQL_USER', 'your_username'),
    'password': os.getenv('MYSQL_PASSWORD', 'your_password'),
    'host': os.getenv('MYSQL_HOST', 'localhost'),
    'database': os.getenv('MYSQL_DB', 'your_database'),
    'raise_on_warnings': True
}

try:
    # Establish the connection
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()

    # Define your SELECT query here
    query = "SELECT * FROM your_table_name LIMIT 10;" # Example query, change as needed
    cursor.execute(query)

    # Fetch all results
    results = cursor.fetchall()

    # Optionally, get column names
    columns = cursor.column_names

    # Write results to the randomly named file
    with open(output_filename, 'w') as f:
        # Write column headers
        f.write("\t".join(columns) + "\n")
        # Write rows
        for row in results:
            f.write("\t".join(map(str, row)) + "\n")

    print(f"Query results successfully written to {output_filename}")

except mysql.connector.Error as err:
    print(f"Error: {err}")
finally:
    # Close connections
    if 'cursor' in locals():
        cursor.close()
    if 'cnx' in locals() and cnx.is_connected():
        cnx.close()
        print("MySQL connection is closed.")