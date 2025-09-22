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
        connection: A connection object to the PostgreSQL database
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
        
        # Creating a cursor object
        cursor = connection.cursor()
        
        # Executing a simple query
        cursor.execute("SELECT version();")
        
        # Fetching the result
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        # Closing the cursor
        cursor.close()
        
        return connection
        
    except (Exception, psycopg2.Error) as error:
        print(f"Error while connecting to PostgreSQL: {error}")
        return None

def close_connection(connection):
    """
    Closes the database connection.
    
    Args:
        connection: The connection object to close
    """
    if connection:
        connection.close()
        print("PostgreSQL connection is closed.")

if __name__ == "__main__":
    # Connect to the database
    conn = connect_to_postgresql()
    
    # Close the connection
    if conn:
        close_connection(conn)