import psycopg2
from psycopg2 import sql

def connect_to_db():
    """Connects to the PostgreSQL database server."""
    conn = None
    try:
        # Connect to the PostgreSQL server
        conn = psycopg2.connect(
            host="localhost",      # Replace with your host
            database="your_db",    # Replace with your database name
            user="your_user",      # Replace with your username
            password="your_password" # Replace with your password
        )
        print("Connected to PostgreSQL database!")
        return conn
    except psycopg2.OperationalError as e:
        print(f"Error connecting to PostgreSQL: {e}")
        if conn:
            conn.close()
        return None

if __name__ == '__main__':
    connection = connect_to_db()
    if connection:
        cursor = connection.cursor()

        # Example: Execute a simple query
        cursor.execute('SELECT version();')
        db_version = cursor.fetchone()
        print(f"PostgreSQL version: {db_version[0]}")

        # Close connections
        cursor.close()
        connection.close()
        print("PostgreSQL connection closed.")
    else:
        print("Failed to establish a database connection.")