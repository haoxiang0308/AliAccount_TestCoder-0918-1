#!/usr/bin/env python3
"""
PostgreSQL Connection Script
This script demonstrates how to connect to a PostgreSQL database using psycopg2.
"""

import psycopg2
from psycopg2 import sql

def connect_to_postgresql():
    """
    Establishes a connection to a PostgreSQL database.
    Returns a connection object if successful, None otherwise.
    """
    try:
        # Database connection parameters
        # Please update these with your actual database credentials
        conn_params = {
            'dbname': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',  # or your database server IP
            'port': '5432'        # default PostgreSQL port
        }
        
        # Establishing the connection
        conn = psycopg2.connect(**conn_params)
        print("Connected to PostgreSQL database successfully!")
        return conn
    
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def main():
    """
    Main function to demonstrate the PostgreSQL connection.
    """
    # Connect to the database
    connection = connect_to_postgresql()
    
    if connection:
        # Get database information
        cursor = connection.cursor()
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"Database version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        print("Database connection closed.")

if __name__ == "__main__":
    main()