#!/usr/bin/env python3
"""
MySQL SELECT Query Script
This script connects to a MySQL database and executes a SELECT query.
"""

import mysql.connector
from mysql.connector import Error
import os


def connect_and_query():
    """
    Connects to MySQL database and executes a SELECT query
    """
    connection = None
    cursor = None
    
    try:
        # Database connection parameters
        # These can be modified or set via environment variables
        host = os.getenv('DB_HOST', 'localhost')
        database = os.getenv('DB_NAME', 'your_database')
        user = os.getenv('DB_USER', 'your_username')
        password = os.getenv('DB_PASSWORD', 'your_password')
        port = os.getenv('DB_PORT', 3306)
        
        # Create connection
        connection = mysql.connector.connect(
            host=host,
            port=port,
            database=database,
            user=user,
            password=password
        )
        
        if connection.is_connected():
            print(f"Successfully connected to MySQL database: {database}")
            
            # Create cursor object
            cursor = connection.cursor()
            
            # Execute SELECT query - this is a sample query, modify as needed
            select_query = "SELECT * FROM your_table LIMIT 10;"  # Modify this query as needed
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            # Get column names
            column_names = [desc[0] for desc in cursor.description]
            print(f"Columns: {column_names}")
            
            # Print the records
            print(f"Number of records: {len(records)}")
            for row in records:
                print(row)
                
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        # Close connections
        if connection and connection.is_connected():
            if cursor:
                cursor.close()
            connection.close()
            print("MySQL connection is closed")


if __name__ == "__main__":
    print("Starting MySQL SELECT query execution...")
    connect_and_query()