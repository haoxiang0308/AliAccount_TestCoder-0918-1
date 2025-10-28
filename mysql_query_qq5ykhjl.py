#!/usr/bin/env python3
"""
MySQL SELECT Query Script
This script connects to a MySQL database and executes a SELECT query.
"""

import mysql.connector
from mysql.connector import Error
import os
from dotenv import load_dotenv  # Optional: for loading environment variables

# Load environment variables from .env file (optional)
# load_dotenv()

def execute_select_query():
    """
    Connects to MySQL database and executes a SELECT query
    """
    connection = None
    cursor = None
    
    try:
        # Database connection parameters
        # You can either hardcode these or use environment variables
        config = {
            'host': os.getenv('DB_HOST', 'localhost'),  # Default to localhost
            'database': os.getenv('DB_NAME', 'your_database_name'),
            'user': os.getenv('DB_USER', 'your_username'),
            'password': os.getenv('DB_PASSWORD', 'your_password'),
            'port': os.getenv('DB_PORT', 3306)  # Default MySQL port
        }
        
        print("Attempting to connect to MySQL database...")
        connection = mysql.connector.connect(**config)
        
        if connection.is_connected():
            print("Successfully connected to MySQL database")
            cursor = connection.cursor()
            
            # Example SELECT query - modify this as needed
            select_query = "SELECT * FROM your_table_name LIMIT 10;"
            
            print(f"Executing query: {select_query}")
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            # Get column names
            column_names = [desc[0] for desc in cursor.description]
            print(f"Column names: {column_names}")
            
            print(f"Total records found: {len(records)}")
            print("\nRecords:")
            for row in records:
                print(row)
                
            return records
            
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        return None
        
    finally:
        # Close connections
        if connection and connection.is_connected():
            if cursor:
                cursor.close()
            connection.close()
            print("\nMySQL connection is closed")

def execute_custom_query(query, params=None):
    """
    Execute a custom SELECT query with optional parameters
    
    Args:
        query (str): The SELECT query to execute
        params (tuple, optional): Parameters for the query
    
    Returns:
        list: Query results
    """
    connection = None
    cursor = None
    
    try:
        config = {
            'host': os.getenv('DB_HOST', 'localhost'),
            'database': os.getenv('DB_NAME', 'your_database_name'),
            'user': os.getenv('DB_USER', 'your_username'),
            'password': os.getenv('DB_PASSWORD', 'your_password'),
            'port': os.getenv('DB_PORT', 3306)
        }
        
        connection = mysql.connector.connect(**config)
        
        if connection.is_connected():
            cursor = connection.cursor()
            print(f"Executing custom query: {query}")
            
            if params:
                cursor.execute(query, params)
            else:
                cursor.execute(query)
                
            records = cursor.fetchall()
            column_names = [desc[0] for desc in cursor.description]
            
            print(f"Column names: {column_names}")
            print(f"Total records found: {len(records)}")
            
            for row in records:
                print(row)
                
            return records
            
    except Error as e:
        print(f"Error while executing query: {e}")
        return None
        
    finally:
        if connection and connection.is_connected():
            if cursor:
                cursor.close()
            connection.close()

if __name__ == "__main__":
    print("MySQL SELECT Query Executor")
    print("=" * 30)
    
    # Execute the default query
    results = execute_select_query()
    
    # Example of how to use the custom query function
    # Uncomment and modify the following lines to execute a custom query:
    # custom_query = "SELECT id, name FROM users WHERE age > %s;"
    # custom_results = execute_custom_query(custom_query, (25,))