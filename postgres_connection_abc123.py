import psycopg2
from psycopg2 import sql
import os
from typing import Optional

def connect_to_postgres(
    host: str = "localhost",
    database: str = "postgres",
    user: str = "postgres",
    password: str = "",
    port: str = "5432"
) -> Optional[psycopg2.extensions.connection]:
    """
    Connect to PostgreSQL database using psycopg2
    
    Args:
        host: Database host address
        database: Name of the database
        user: Database user
        password: Password for the user
        port: Port number for the database
    
    Returns:
        Connection object if successful, None otherwise
    """
    try:
        # Attempt to connect to the database
        connection = psycopg2.connect(
            host=host,
            database=database,
            user=user,
            password=password,
            port=port
        )
        
        print("Successfully connected to PostgreSQL database!")
        return connection
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def main():
    """
    Main function to demonstrate PostgreSQL connection
    """
    # You can set environment variables for security
    db_host = os.getenv("DB_HOST", "localhost")
    db_name = os.getenv("DB_NAME", "postgres")
    db_user = os.getenv("DB_USER", "postgres")
    db_password = os.getenv("DB_PASSWORD", "")  # In production, use secure method to store password
    db_port = os.getenv("DB_PORT", "5432")
    
    # Connect to the database
    conn = connect_to_postgres(
        host=db_host,
        database=db_name,
        user=db_user,
        password=db_password,
        port=db_port
    )
    
    if conn:
        try:
            # Create a cursor object
            cursor = conn.cursor()
            
            # Execute a simple query to test the connection
            cursor.execute("SELECT version();")
            db_version = cursor.fetchone()
            print(f"PostgreSQL version: {db_version[0]}")
            
            # Close cursor and connection
            cursor.close()
            conn.close()
            print("Connection closed successfully.")
            
        except psycopg2.Error as e:
            print(f"Error executing query: {e}")
            if conn:
                conn.close()
                print("Connection closed due to error.")
    else:
        print("Failed to establish connection.")

if __name__ == "__main__":
    main()