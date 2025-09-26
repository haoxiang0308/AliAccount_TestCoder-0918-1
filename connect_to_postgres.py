import psycopg2
from psycopg2 import sql

# Database connection parameters
DB_PARAMS = {
    'dbname': 'your_database_name',
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',  # or your database host
    'port': '5432',       # or your database port
}

def connect_to_db():
    """Connects to the PostgreSQL database using parameters from DB_PARAMS."""
    try:
        connection = psycopg2.connect(**DB_PARAMS)
        print("Successfully connected to the database!")
        return connection
    except psycopg2.OperationalError as e:
        print(f"Error connecting to database: {e}")
        return None

def main():
    """Main function to demonstrate the connection."""
    conn = connect_to_db()
    if conn:
        # Example: Print server version
        cursor = conn.cursor()
        cursor.execute('SELECT version();')
        db_version = cursor.fetchone()
        print(f"PostgreSQL Database Version: {db_version[0]}")
        
        # Close connections
        cursor.close()
        conn.close()
        print("Database connection closed.")

if __name__ == "__main__":
    main()