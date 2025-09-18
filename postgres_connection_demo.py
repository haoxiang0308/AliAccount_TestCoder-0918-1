#!/usr/bin/env python3
"""
PostgreSQL Connection Script
This script demonstrates how to connect to a PostgreSQL database using psycopg2.
"""

import psycopg2
from psycopg2 import sql

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
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"Error while connecting to PostgreSQL: {error}")

if __name__ == "__main__":
    connect_to_postgres()