#!/usr/bin/env python3
"""
PostgreSQL Connection Script
This script demonstrates how to connect to a PostgreSQL database using psycopg2.
"""

import psycopg2
from psycopg2 import sql

# Database connection parameters
DB_HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "your_database_name"
DB_USER = "your_username"
DB_PASSWORD = "your_password"

def connect_to_db():
    """Establish a connection to the PostgreSQL database."""
    try:
        # Connect to the PostgreSQL database
        connection = psycopg2.connect(
            host=DB_HOST,
            port=DB_PORT,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD
        )
        
        print("Connected to PostgreSQL database successfully!")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query
        cursor.execute("SELECT version();")
        
        # Fetch the result
        db_version = cursor.fetchone()
        print(f"Database version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        print("Connection closed.")
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    connect_to_db()