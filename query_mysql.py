import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    """
    Connects to a MySQL database and executes a SELECT query.
    Results are printed to the console.
    """
    connection = None
    cursor = None
    try:
        # Configuration - Replace these with your database details
        config = {
            'host': 'localhost',  # e.g., 'localhost' or an IP address
            'database': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password',
            'port': 3306  # Default MySQL port
        }

        connection = mysql.connector.connect(**config)
        if connection.is_connected():
            print(f"Connected to MySQL database")
            cursor = connection.cursor()
            # Example SELECT query - modify as needed
            select_query = "SELECT * FROM your_table_name LIMIT 5;"
            cursor.execute(select_query)
            records = cursor.fetchall()

            print(f"Query executed: {select_query}")
            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        if connection and connection.is_connected():
            if cursor:
                cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    # Generate a random filename using uuid
    random_filename = f"query_script_{uuid.uuid4().hex[:8]}.py"
    print(f"This script would normally be saved as: {random_filename}")
    print("-" * 20)
    execute_select_query()