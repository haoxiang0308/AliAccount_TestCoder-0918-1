#!/usr/bin/env python3
"""
PostgreSQL Connection Script
This script demonstrates how to connect to a PostgreSQL database using psycopg2.
"""

import psycopg2
from psycopg2 import sql

def connect_to_postgresql():
    """Establish a connection to PostgreSQL database."""
    try:
        # Database connection parameters
        # Please update these with your actual database credentials
        conn_params = {
            'dbname': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',  # or your database server IP
            'port': '5432'        # default PostgreSQL port
        }
        
        # Establishing the connection
        print("Connecting to PostgreSQL database...")
        conn = psycopg2.connect(**conn_params)
        
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
        
        return True
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return False
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return False

def main():
    """Main function to run the PostgreSQL connection example."""
    print("PostgreSQL Connection Example")
    print("=" * 30)
    
    if connect_to_postgresql():
        print("\nConnection successful!")
    else:
        print("\nConnection failed!")

if __name__ == "__main__":
    main()