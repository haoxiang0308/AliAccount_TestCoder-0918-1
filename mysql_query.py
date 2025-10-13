import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    """
    Connects to a MySQL database and executes a SELECT query.
    Results are printed to the console.
    The script name is generated randomly.
    """
    # Configuration - Update these with your database details
    config = {
        'user': 'your_username',
        'password': 'your_password',
        'host': 'localhost', # or your MySQL server address
        'database': 'your_database',
        'raise_on_warnings': True
    }

    connection = None
    cursor = None
    try:
        print(f"Connecting to MySQL database...")
        connection = mysql.connector.connect(**config)

        if connection.is_connected():
            db_info = connection.get_server_info()
            print(f"Connected to MySQL Server version {db_info}")
            cursor = connection.cursor()

            # Example SELECT query - Modify this query as needed
            select_query = "SELECT * FROM your_table LIMIT 5;"
            print(f"Executing query: {select_query}")
            cursor.execute(select_query)

            records = cursor.fetchall()
            print(f"Total number of rows in result: {cursor.rowcount}")
            print("\n--- Query Results ---")
            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        if connection and connection.is_connected():
            if cursor:
                cursor.close()
            connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    # This script's name is fixed for demonstration.
    # In the actual tool use, the filename would be generated randomly.
    print(f"Running script: mysql_query.py")
    execute_select_query()
