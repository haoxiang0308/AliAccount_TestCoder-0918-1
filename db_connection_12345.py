import psycopg2
from psycopg2 import sql

def connect_to_db():
    """Connects to the PostgreSQL database."""
    try:
        # Connection parameters - replace with your actual database details
        connection_params = {
            'host': 'localhost',      # or the host where your DB is running
            'database': 'your_db_name',
            'user': 'your_username',
            'password': 'your_password',
            'port': '5432'            # default PostgreSQL port
        }

        connection = psycopg2.connect(**connection_params)
        print("Successfully connected to the database!")
        return connection

    except psycopg2.OperationalError as e:
        print(f"Error connecting to database: {e}")
        return None

if __name__ == "__main__":
    conn = connect_to_db()
    if conn:
        print("Connection object created. You can now perform database operations.")
        # Example: Create a cursor to perform database operations
        # cursor = conn.cursor()
        # cursor.execute('SELECT version();')
        # db_version = cursor.fetchone()
        # print(f"PostgreSQL version: {db_version}")
        # cursor.close()
        # Don't forget to close the connection when done
        # conn.close()
    else:
        print("Failed to establish a database connection.")