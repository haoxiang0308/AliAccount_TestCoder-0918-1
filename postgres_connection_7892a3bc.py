#!/usr/bin/env python3
"""
PostgreSQL Connection Script
This script demonstrates how to connect to a PostgreSQL database using psycopg2.
"""

import psycopg2
from psycopg2 import sql

def connect_to_postgres():
    """Establish a connection to PostgreSQL database."""
    try:
        # Database connection parameters
        connection_params = {
            'host': 'localhost',
            'database': 'your_database',
            'user': 'your_username',
            'password': 'your_password',
            'port': '5432'
        }
        
        # Establishing the connection
        connection = psycopg2.connect(**connection_params)
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Print PostgreSQL connection properties
        print("Connected to PostgreSQL database")
        print("PostgreSQL server information:")
        print(connection.get_dsn_parameters(), "\n")
        
        # Executing a simple query
        cursor.execute("SELECT version();")
        
        # Fetch result
        record = cursor.fetchone()
        print("You are connected to - ", record, "\n")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")
        
    except (Exception, psycopg2.Error) as error:
        print("Error while connecting to PostgreSQL:", error)

if __name__ == "__main__":
    connect_to_postgres()