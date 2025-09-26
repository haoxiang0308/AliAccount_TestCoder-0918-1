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
        # --- Configuration ---
        # Replace these values with your actual database details
        host = 'localhost'  # e.g., 'localhost' or an IP address
        database = 'your_database_name'
        user = 'your_username'
        password = 'your_password'
        table_name = 'your_table_name'  # The table you want to query
        # ---------------------

        connection = mysql.connector.connect(
            host=host,
            database=database,
            user=user,
            password=password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Example SELECT query. Modify as needed.
            query = f"SELECT * FROM {table_name};"
            cursor.execute(query)

            # Fetch all rows
            records = cursor.fetchall()

            print(f"Total number of rows in table '{table_name}': {cursor.rowcount}")
            print("\n--- Query Results ---")
            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("\nMySQL connection is closed.")

if __name__ == "__main__":
    # Generate a random filename for this script instance
    random_filename = f"mysql_query_script_{uuid.uuid4().hex[:8]}.py"
    print(f"This script is saved as: {random_filename}")
    # Note: The filename generation is just for demonstration here.
    # The actual file is saved as 'mysql_query.py' by the tool that created this.
    execute_select_query()
