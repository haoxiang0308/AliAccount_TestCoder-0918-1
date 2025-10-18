import psycopg2
from psycopg2 import sql
import sys

def connect_to_postgresql():
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Database connection parameters
        connection = psycopg2.connect(
            host="localhost",          # Change this to your host
            database="your_database",  # Change this to your database name
            user="your_username",      # Change this to your username
            password="your_password"   # Change this to your password
        )
        
        print("Successfully connected to PostgreSQL database")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        
        print("PostgreSQL connection is closed")
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        sys.exit(1)

if __name__ == "__main__":
    connect_to_postgresql()