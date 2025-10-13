import mysql.connector
import os
import random
import string

def execute_select_query():
    """
    Connects to a MySQL database, executes a SELECT query,
    and prints the results.
    """
    # --- Configuration ---
    # It's recommended to use environment variables for credentials.
    config = {
        'user': os.getenv('DB_USER', 'your_username'),
        'password': os.getenv('DB_PASSWORD', 'your_password'),
        'host': os.getenv('DB_HOST', 'localhost'),
        'database': os.getenv('DB_NAME', 'your_database'),
        'raise_on_warnings': True
    }

    query = "SELECT * FROM your_table LIMIT 5;"  # Example query

    try:
        # Establish connection
        cnx = mysql.connector.connect(**config)
        cursor = cnx.cursor()

        # Execute the query
        cursor.execute(query)

        # Fetch all results
        rows = cursor.fetchall()

        # Get column names
        columns = cursor.column_names

        # Print results
        print(f"Fetched {len(rows)} rows.")
        print(f"Columns: {columns}")
        for row in rows:
            print(row)

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        # Close connections
        if cursor:
            cursor.close()
        if cnx and cnx.is_connected():
            cnx.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    execute_select_query()
