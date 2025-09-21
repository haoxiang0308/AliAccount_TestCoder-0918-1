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
    
    Returns:
        connection: A connection object to the PostgreSQL database.
    """
    try:
        # Database connection parameters
        # Please update these with your actual database credentials
        connection_params = {
            'dbname': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',  # or your database host
            'port': '5432'        # default PostgreSQL port
        }
        
        # Establishing the connection
        connection = psycopg2.connect(**connection_params)
        print("Connected to PostgreSQL database successfully!")
        
        return connection
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def main():
    """
    Main function to demonstrate the PostgreSQL connection.
    """
    connection = connect_to_postgresql()
    
    if connection:
        # Perform database operations here
        cursor = connection.cursor()
        
        # Example: Execute a simple query
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"Database version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        print("Database connection closed.")

if __name__ == "__main__":
    main()