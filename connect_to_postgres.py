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
        print("Connected to the PostgreSQL server successfully.")
        return conn
    except psycopg2.OperationalError as e:
        print(f"Error connecting to PostgreSQL: {e}")
        if conn:
            conn.close()
        return None

if __name__ == '__main__':
    connection = connect_to_db()
    if connection:
        print("Connection object created. You can now execute queries.")
        # Example: Create a cursor and execute a simple query
        cur = connection.cursor()
        cur.execute('SELECT version();')
        db_version = cur.fetchone()
        print(f"PostgreSQL Database version: {db_version}")
        # Close the cursor and connection
        cur.close()
        connection.close()
        print("PostgreSQL connection is closed.")
    else:
        print("Failed to establish a connection.")