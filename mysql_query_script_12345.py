import mysql.connector
from mysql.connector import Error
import os

def execute_select_query():
    """
    Connects to a MySQL database using environment variables for credentials,
    executes a SELECT query, and prints the results.
    """
    connection = None
    try:
        # Establish the connection using environment variables for security
        connection = mysql.connector.connect(
            host=os.getenv('DB_HOST', 'localhost'),
            port=os.getenv('DB_PORT', 3306),
            database=os.getenv('DB_NAME'),
            user=os.getenv('DB_USER'),
            password=os.getenv('DB_PASSWORD')
        )

        if connection.is_connected():
            print("Successfully connected to the database")
            cursor = connection.cursor()

            # Example SELECT query - replace with your actual query
            query = "SELECT * FROM your_table_name LIMIT 5;"
            cursor.execute(query)

            # Fetch all results
            records = cursor.fetchall()
            print(f"Total number of rows in result: {cursor.rowcount}")

            # Print column names
            column_names = [i[0] for i in cursor.description]
            print("Column names:", column_names)

            # Print each row
            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        # Close the connection
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    execute_select_query()
