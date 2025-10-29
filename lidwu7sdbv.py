#!/usr/bin/env python3
"""
PostgreSQL connection script using psycopg2
"""

import psycopg2
from psycopg2 import sql
import os


def connect_to_postgresql():
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Connection parameters - these can be configured via environment variables
        connection_params = {
            'host': os.getenv('DB_HOST', 'localhost'),
            'database': os.getenv('DB_NAME', 'postgres'),
            'user': os.getenv('DB_USER', 'postgres'),
            'password': os.getenv('DB_PASSWORD', 'password'),
            'port': os.getenv('DB_PORT', '5432')
        }

        # Establish the connection
        conn = psycopg2.connect(**connection_params)
        
        print("Successfully connected to PostgreSQL database!")
        
        # Create a cursor object
        cursor = conn.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute('SELECT version();')
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        # Close cursor and connection
        cursor.close()
        conn.close()
        
        print("Connection closed.")
        
    except psycopg2.Error as error:
        print(f"Error connecting to PostgreSQL: {error}")
        return None
    
    return conn


def execute_query(connection, query):
    """
    Execute a given query on the provided connection
    """
    try:
        cursor = connection.cursor()
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.close()
        return result
    except psycopg2.Error as error:
        print(f"Error executing query: {error}")
        return None


if __name__ == "__main__":
    # Connect to PostgreSQL
    connection = connect_to_postgresql()
    
    # Example of how to use the connection for queries if needed
    # if connection:
    #     results = execute_query(connection, "SELECT * FROM some_table;")
    #     print(results)