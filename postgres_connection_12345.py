import psycopg2
from psycopg2 import sql
import os

def connect_to_postgres():
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Connection parameters - you may need to adjust these
        connection = psycopg2.connect(
            host=os.getenv('DB_HOST', 'localhost'),
            database=os.getenv('DB_NAME', 'postgres'),
            user=os.getenv('DB_USER', 'postgres'),
            password=os.getenv('DB_PASSWORD', 'password'),
            port=os.getenv('DB_PORT', '5432')
        )
        
        print("Successfully connected to PostgreSQL database!")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute('SELECT version();')
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        
        return True
        
    except psycopg2.Error as error:
        print(f"Error connecting to PostgreSQL database: {error}")
        return False

if __name__ == "__main__":
    connect_to_postgres()