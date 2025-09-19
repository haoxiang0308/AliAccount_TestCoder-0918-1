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
            'host': 'localhost',  # or your database server IP
            'port': '5432'        # default PostgreSQL port
        }
        
        # Establishing the connection
        connection = psycopg2.connect(**connection_params)
        
        print("Connected to PostgreSQL database successfully!")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query
        cursor.execute("SELECT version();")
        
        # Fetch result
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        
        return connection
        
    except (Exception, psycopg2.Error) as error:
        print(f"Error while connecting to PostgreSQL: {error}")
        return None

def execute_sample_query(connection):
    """
    Executes a sample query on the database.
    
    Args:
        connection: A psycopg2 connection object
    """
    try:
        cursor = connection.cursor()
        
        # Sample query - replace with your own query
        query = "SELECT * FROM information_schema.tables LIMIT 5;"
        cursor.execute(query)
        
        # Fetch results
        records = cursor.fetchall()
        print(f"Found {cursor.rowcount} records:")
        
        for row in records:
            print(row)
            
        cursor.close()
        
    except (Exception, psycopg2.Error) as error:
        print(f"Error while fetching data: {error}")

if __name__ == "__main__":
    # Connect to the database
    conn = connect_to_postgresql()
    
    # If connection is successful, execute a sample query
    if conn:
        execute_sample_query(conn)