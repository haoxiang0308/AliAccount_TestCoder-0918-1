#!/usr/bin/env python3
"""
PostgreSQL Connection Script
This script demonstrates how to connect to a PostgreSQL database using psycopg2.
"""

import psycopg2
from psycopg2 import sql
import random
import string
import os

def generate_random_string(length=8):
    """Generate a random string of fixed length."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def connect_to_postgres():
    """Establish a connection to PostgreSQL database."""
    try:
        # Database connection parameters
        # Note: In production, use environment variables or a config file
        conn_params = {
            'dbname': os.getenv('DB_NAME', 'your_database'),
            'user': os.getenv('DB_USER', 'your_username'),
            'password': os.getenv('DB_PASSWORD', 'your_password'),
            'host': os.getenv('DB_HOST', 'localhost'),
            'port': os.getenv('DB_PORT', '5432')
        }
        
        # Establishing the connection
        conn = psycopg2.connect(**conn_params)
        print("Connected to PostgreSQL database successfully!")
        
        # Create a cursor object
        cur = conn.cursor()
        
        # Execute a simple query
        cur.execute("SELECT version();")
        
        # Fetch result
        db_version = cur.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        # Close the cursor and connection
        cur.close()
        conn.close()
        print("Database connection closed.")
        
    except Exception as error:
        print(f"Error connecting to PostgreSQL: {error}")

if __name__ == "__main__":
    # Generate and print a random string (for demonstration)
    random_name = generate_random_string()
    print(f"Random identifier: {random_name}")
    
    # Connect to PostgreSQL
    connect_to_postgres()