import psycopg2
from psycopg2 import sql

def connect_to_db():
    """Connects to the PostgreSQL database."""
    try:
        # Replace these connection parameters with your actual database credentials
        connection = psycopg2.connect(
            host="localhost",      # e.g., "localhost" or an IP address
            database="your_db_name",
            user="your_username",
            password="your_password",
            port=5432              # Default PostgreSQL port
        )
        print("Successfully connected to PostgreSQL!")
        return connection
    except psycopg2.OperationalError as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def main():
    conn = connect_to_db()
    if conn:
        cursor = conn.cursor()

        # Example: Execute a simple query
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL version: {db_version[0]}")

        # Close connections
        cursor.close()
        conn.close()
        print("PostgreSQL connection closed.")

if __name__ == "__main__":
    main()