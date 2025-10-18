import psycopg2
from psycopg2 import sql
import sys

def connect_to_postgres():
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Connection parameters - these would typically come from environment variables or config
        connection = psycopg2.connect(
            host="localhost",          # Hostname of the PostgreSQL server
            database="your_database",  # Name of the database to connect to
            user="your_username",      # Username for authentication
            password="your_password",  # Password for authentication
            port="5432"               # Port number (default is 5432)
        )
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"Successfully connected to PostgreSQL database!")
        print(f"PostgreSQL version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        
        return True
        
    except psycopg2.Error as error:
        print(f"Error while connecting to PostgreSQL: {error}")
        return False
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return False

def execute_query(connection, query):
    """
    Execute a given query on the provided connection
    """
    try:
        cursor = connection.cursor()
        cursor.execute(query)
        result = cursor.fetchall()
        return result
    except psycopg2.Error as error:
        print(f"Error executing query: {error}")
        return None

if __name__ == "__main__":
    success = connect_to_postgres()
    if success:
        print("Connection test completed successfully.")
    else:
        print("Connection test failed.")
        sys.exit(1)