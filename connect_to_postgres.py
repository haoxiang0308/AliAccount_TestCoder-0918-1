"""
This script demonstrates how to connect to a PostgreSQL database using psycopg2.
Make sure to install psycopg2 before running: pip install psycopg2
"""

import psycopg2
from psycopg2 import sql

# Database connection parameters
DB_CONFIG = {
    'dbname': 'your_database_name',
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',  # or the host address of your database server
    'port': '5432',       # default PostgreSQL port
}

def connect_to_db():
    """Attempts to connect to the PostgreSQL database."""
    try:
        print("Attempting to connect to the database...")
        connection = psycopg2.connect(**DB_CONFIG)
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute('SELECT version();')
        db_version = cursor.fetchone()
        print(f"Successfully connected to PostgreSQL! Version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        print("Database connection closed.")
        
    except psycopg2.OperationalError as e:
        print(f"Error connecting to PostgreSQL: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    connect_to_db()