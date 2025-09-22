#!/usr/bin/env python3
"""
PostgreSQL Connection Demo
This script demonstrates how to connect to a PostgreSQL database using psycopg2.
"""

import psycopg2
from psycopg2 import sql
import random
import string
import os
from dotenv import load_dotenv

# Load environment variables from .env file (if it exists)
load_dotenv()

def generate_random_string(length=10):
    """Generate a random string of fixed length."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def connect_to_postgres():
    """Establish a connection to PostgreSQL database."""
    try:
        # Database connection parameters
        # Using environment variables for sensitive information
        conn = psycopg2.connect(
            host=os.getenv('DB_HOST', 'localhost'),
            database=os.getenv('DB_NAME', 'postgres'),
            user=os.getenv('DB_USER', 'postgres'),
            password=os.getenv('DB_PASSWORD', ''),
            port=os.getenv('DB_PORT', '5432')
        )
        
        print("Connected to PostgreSQL database successfully!")
        return conn
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def create_sample_table(conn):
    """Create a sample table for demonstration."""
    try:
        cursor = conn.cursor()
        
        # Create table with a random name to avoid conflicts
        table_name = f"sample_table_{generate_random_string(5)}"
        
        create_table_query = sql.SQL("""
            CREATE TABLE IF NOT EXISTS {} (
                id SERIAL PRIMARY KEY,
                name VARCHAR(100) NOT NULL,
                email VARCHAR(100) UNIQUE NOT NULL,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )
        """).format(sql.Identifier(table_name))
        
        cursor.execute(create_table_query)
        conn.commit()
        
        print(f"Table '{table_name}' created successfully!")
        return table_name
    except psycopg2.Error as e:
        print(f"Error creating table: {e}")
        return None

def insert_sample_data(conn, table_name):
    """Insert sample data into the table."""
    try:
        cursor = conn.cursor()
        
        # Sample data
        sample_data = [
            ('John Doe', 'john.doe@example.com'),
            ('Jane Smith', 'jane.smith@example.com'),
            ('Bob Johnson', 'bob.johnson@example.com')
        ]
        
        insert_query = sql.SQL("""
            INSERT INTO {} (name, email)
            VALUES (%s, %s)
        """).format(sql.Identifier(table_name))
        
        for data in sample_data:
            cursor.execute(insert_query, data)
        
        conn.commit()
        print(f"Inserted {cursor.rowcount} records into '{table_name}'")
    except psycopg2.Error as e:
        print(f"Error inserting data: {e}")

def fetch_data(conn, table_name):
    """Fetch and display data from the table."""
    try:
        cursor = conn.cursor()
        
        select_query = sql.SQL("SELECT * FROM {}").format(sql.Identifier(table_name))
        cursor.execute(select_query)
        
        records = cursor.fetchall()
        print(f"\nData from '{table_name}':")
        print("-" * 50)
        for row in records:
            print(row)
    except psycopg2.Error as e:
        print(f"Error fetching data: {e}")

def main():
    """Main function to demonstrate PostgreSQL connection."""
    print("PostgreSQL Connection Demo")
    print("=" * 30)
    
    # Connect to PostgreSQL
    conn = connect_to_postgres()
    if not conn:
        return
    
    try:
        # Create a sample table
        table_name = create_sample_table(conn)
        if not table_name:
            return
        
        # Insert sample data
        insert_sample_data(conn, table_name)
        
        # Fetch and display data
        fetch_data(conn, table_name)
        
    finally:
        # Close the connection
        if conn:
            conn.close()
            print("\nDatabase connection closed.")

if __name__ == "__main__":
    main()