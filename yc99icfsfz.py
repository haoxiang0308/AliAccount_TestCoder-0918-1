import psycopg2
from psycopg2 import sql
import sys

def connect_to_postgres():
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Database connection parameters - these would need to be updated with actual values
        connection = psycopg2.connect(
            host="localhost",          # Host address
            database="your_database",  # Database name
            user="your_username",      # Username
            password="your_password",  # Password
            port="5432"               # Port number (default is 5432)
        )
        
        print("Successfully connected to PostgreSQL database!")
        
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

if __name__ == "__main__":
    conn, cur = connect_to_postgres()
    
    if conn and cur:
        # Perform database operations here if needed
        pass
    
    close_connection(conn, cur)