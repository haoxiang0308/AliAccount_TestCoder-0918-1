import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    """
    Connects to a MySQL database and executes a SELECT query.
    Results are printed to the console.
    """
    connection = None
    try:
        # --- Configuration: Update these values to match your database ---
        host = 'localhost'  # e.g., 'localhost' or an IP address
        database = 'your_database_name'
        user = 'your_username'
        password = 'your_password'
        port = 3306  # Default MySQL port

        # Establish the connection
        connection = mysql.connector.connect(
            host=host,
            database=database,
            user=user,
            password=password,
            port=port
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Example SELECT query - modify as needed
            select_query = "SELECT * FROM your_table_name LIMIT 10;"
            cursor.execute(select_query)

            # Fetch results
            records = cursor.fetchall()

            # Print results
            print(f"Query executed: {select_query}")
            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    execute_select_query()