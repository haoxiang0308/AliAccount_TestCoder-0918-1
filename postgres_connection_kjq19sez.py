#!/usr/bin/env python3
"""
PostgreSQL Connection Script using psycopg2
This script demonstrates how to connect to a PostgreSQL database.
"""

import psycopg2
from psycopg2 import sql
import sys

def connect_to_postgres():
    # Database connection parameters
    # Please update these with your actual database credentials
    db_params = {
        'dbname': 'your_database_name',
        'user': 'your_username',
        'password': 'your_password',
        'host': 'localhost',  # or your database server IP
        'port': '5432'        # default PostgreSQL port
    }
    
    try:
        # Establishing the connection
        print("Connecting to PostgreSQL database...")
        conn = psycopg2.connect(**db_params)
        
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
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        sys.exit(1)

if __name__ == "__main__":
    connect_to_postgres()