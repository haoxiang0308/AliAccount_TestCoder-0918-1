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
            password="your_pass"   # Replace with your password
        )
        print("Connected to the PostgreSQL database!")
        return conn
    except psycopg2.OperationalError as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return conn # Returns None if connection fails

def test_connection():
    """Test the database connection by executing a simple query."""
    conn = connect_to_db()
    if conn:
        try:
            cur = conn.cursor()
            cur.execute('SELECT version();')
            db_version = cur.fetchone()
            print(f"PostgreSQL version: {db_version[0]}")
            cur.close()
        except psycopg2.Error as e:
            print(f"Error executing query: {e}")
        finally:
            conn.close()
            print("Database connection closed.")

if __name__ == '__main__':
    test_connection()