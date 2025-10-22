import psycopg2
from psycopg2 import sql
import random
import string

def connect_to_postgres():
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Connection parameters - these would need to be updated with actual values
        connection = psycopg2.connect(
            host="localhost",          # Database host
            database="your_database",  # Database name
            user="your_username",      # Database user
            password="your_password",  # Database password
            port="5432"               # Database port
        )
        
        print("Successfully connected to PostgreSQL!")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        return connection, cursor
        
    except psycopg2.Error as error:
        print(f"Error connecting to PostgreSQL: {error}")
        return None, None

def close_connection(connection, cursor):
    """
    Close the database connection and cursor
    """
    if cursor:
        cursor.close()
    if connection:
        connection.close()
        print("PostgreSQL connection closed.")

# Example usage
if __name__ == "__main__":
    conn, cur = connect_to_postgres()
    
    if conn and cur:
        # Perform database operations here
        # For example, create a table, insert data, etc.
        
        close_connection(conn, cur)
    else:
        print("Failed to establish connection.")