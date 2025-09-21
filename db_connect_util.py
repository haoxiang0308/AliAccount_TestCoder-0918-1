#!/usr/bin/env python3
"""
Database Connection Utility
A simple script to connect to PostgreSQL using psycopg2.
"""

import psycopg2
import sys

def create_connection(db_name, db_user, db_password, db_host, db_port):
    """
    Create a database connection to a PostgreSQL database.
    
    Parameters:
        db_name (str): Name of the database
        db_user (str): Username for authentication
        db_password (str): Password for authentication
        db_host (str): Host address of the database
        db_port (str): Port number of the database
    
    Returns:
        conn: Connection object or None
    """
    try:
        conn = psycopg2.connect(
            database=db_name,
            user=db_user,
            password=db_password,
            host=db_host,
            port=db_port
        )
        print("Connection to PostgreSQL DB successful")
        return conn
    except psycopg2.OperationalError as e:
        print(f"The error '{e}' occurred")
        return None

if __name__ == "__main__":
    # Example usage with placeholder values
    # Replace these with actual database credentials
    connection = create_connection(
        "test_db", 
        "test_user", 
        "test_password", 
        "127.0.0.1", 
        "5432"
    )
    
    if connection:
        connection.close()
        print("Connection closed")