import psycopg2
from psycopg2 import sql
import os
from typing import Optional

def connect_to_postgres(
    host: str = "localhost",
    database: str = "your_database",
    user: str = "your_username",
    password: str = "your_password",
    port: int = 5432
) -> Optional[psycopg2.extensions.connection]:
    """
    Connect to PostgreSQL database using psycopg2
    
    Args:
        host: Database host address
        database: Database name
        user: Database user
        password: User password
        port: Database port
    
    Returns:
        Connection object if successful, None otherwise
    """
    try:
        # Create connection string
        connection = psycopg2.connect(
            host=host,
            database=database,
            user=user,
            password=password,
            port=port
        )
        
        print("Successfully connected to PostgreSQL database")
        return connection
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def execute_query(connection: psycopg2.extensions.connection, query: str):
    """
    Execute a SQL query on the given connection
    
    Args:
        connection: Active PostgreSQL connection
        query: SQL query to execute
    """
    try:
        cursor = connection.cursor()
        cursor.execute(query)
        
        # If it's a SELECT query, fetch results
        if query.strip().upper().startswith("SELECT"):
            results = cursor.fetchall()
            for row in results:
                print(row)
            return results
        else:
            # For INSERT, UPDATE, DELETE operations
            connection.commit()
            print(f"Query executed successfully. Rows affected: {cursor.rowcount}")
            
    except psycopg2.Error as e:
        print(f"Error executing query: {e}")
        connection.rollback()

def main():
    """Main function demonstrating PostgreSQL connection"""
    
    # You can set environment variables for security
    db_host = os.getenv("DB_HOST", "localhost")
    db_name = os.getenv("DB_NAME", "your_database")
    db_user = os.getenv("DB_USER", "your_username")
    db_pass = os.getenv("DB_PASS", "your_password")
    db_port = int(os.getenv("DB_PORT", "5432"))
    
    # Connect to PostgreSQL
    conn = connect_to_postgres(
        host=db_host,
        database=db_name,
        user=db_user,
        password=db_pass,
        port=db_port
    )
    
    if conn:
        # Example query - replace with your actual query
        query = "SELECT version();"
        execute_query(conn, query)
        
        # Close the connection
        conn.close()
        print("PostgreSQL connection closed")

if __name__ == "__main__":
    main()