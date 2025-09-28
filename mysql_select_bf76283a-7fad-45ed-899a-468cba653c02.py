import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    """
    Connects to a MySQL database and executes a SELECT query.
    Results are printed to the console.
    The script name includes a random UUID.
    """
    # Configuration - Replace these with your database details
    config = {
        'host': 'localhost',
        'database': 'your_database_name',
        'user': 'your_username',
        'password': 'your_password',
        'port': 3306
    }

    connection = None
    cursor = None

    try:
        # Establish the connection
        connection = mysql.connector.connect(**config)

        if connection.is_connected():
            print(f"Successfully connected to the database.")

            # Create a cursor object
            cursor = connection.cursor()

            # Define your SELECT query here
            select_query = "SELECT * FROM your_table_name LIMIT 5;"  # Example query

            # Execute the query
            cursor.execute(select_query)

            # Fetch all results
            records = cursor.fetchall()

            # Get column names
            column_names = [desc[0] for desc in cursor.description]

            # Print column names
            print(" | ".join(column_names))
            print("-" * len(" | ".join(column_names)))

            # Print rows
            for row in records:
                print(" | ".join(map(str, row)))

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        # Close connections
        if cursor and cursor.is_connected():
            cursor.close()
        if connection and connection.is_connected():
            connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    execute_select_query()
