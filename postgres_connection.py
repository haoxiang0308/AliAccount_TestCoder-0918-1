import psycopg2
from psycopg2 import sql
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def connect_to_postgres(host, database, user, password, port=5432):
    """
    Connect to PostgreSQL database using psycopg2
    
    Args:
        host (str): Database host
        database (str): Database name
        user (str): Username
        password (str): Password
        port (int): Port number (default 5432)
    
    Returns:
        connection: psycopg2 connection object
    """
    try:
        # Establish connection
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
    # Example connection parameters (these would need to be updated with actual values)
    HOST = "localhost"  # Replace with your host
    DATABASE = "your_database"  # Replace with your database name
    USER = "your_username"  # Replace with your username
    PASSWORD = "your_password"  # Replace with your password
    PORT = 5432  # Default PostgreSQL port
    
    # Connect to the database
    conn = connect_to_postgres(HOST, DATABASE, USER, PASSWORD, PORT)
    
    if conn:
        # Create a cursor object
        cursor = conn.cursor()
        
        # Example: Execute a simple query
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL version: {db_version[0]}")
        
        # Close connections
        cursor.close()
        conn.close()
        print("PostgreSQL connection closed.")
    
    # Generate a random filename
    random_filename = generate_random_filename()
    print(f"Random filename generated: {random_filename}")
    
    # Save this script with the random filename
    with open(__file__, 'r') as original_file:
        script_content = original_file.read()
    
    with open(f"/workspace/{random_filename}", 'w') as new_file:
        new_file.write(script_content)
    
    print(f"Script saved to: /workspace/{random_filename}")

if __name__ == "__main__":
    main()