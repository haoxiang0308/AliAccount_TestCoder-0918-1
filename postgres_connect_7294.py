import psycopg2
from psycopg2 import sql

# Database connection parameters
conn_params = {
    'host': 'localhost',      # e.g., 'localhost' or an IP address
    'database': 'your_db',    # your database name
    'user': 'your_user',      # your database user
    'password': 'your_pass',  # your database password
    'port': '5432'            # default PostgreSQL port
}

def connect_to_db():
    """Connects to the PostgreSQL database using parameters in conn_params."""
    try:
        # Establish the connection
        conn = psycopg2.connect(**conn_params)
        print("Connection to PostgreSQL DB successful")
        return conn
    except psycopg2.OperationalError as e:
        print(f"Error connecting to PostgreSQL DB: {e}")
        return None

def close_connection(conn):
    """Closes the database connection."""
    if conn:
        conn.close()
        print("PostgreSQL connection is closed")

# Example usage
if __name__ == "__main__":
    connection = connect_to_db()
    if connection:
        # Perform database operations here
        cursor = connection.cursor()
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL Database version: {db_version}")
        close_connection(connection)