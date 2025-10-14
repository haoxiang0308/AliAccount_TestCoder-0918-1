import psycopg2
from psycopg2 import sql

def connect_to_db():
  """Connects to the PostgreSQL database."""
  try:
    # Replace these connection details with your actual database credentials
    connection = psycopg2.connect(
        host="localhost",      # e.g., 'localhost' or an IP address
        database="your_db_name", # e.g., 'mydatabase'
        user="your_username",    # e.g., 'postgres'
        password="your_password" # e.g., 'secret'
    )
    return connection
  except psycopg2.OperationalError as e:
    print(f"Error connecting to PostgreSQL: {e}")
    return None

def main():
  """Main function to demonstrate the connection."""
  conn = connect_to_db()
  if conn:
    print("Successfully connected to PostgreSQL!")
    # Example: Create a cursor and execute a simple query
    cur = conn.cursor()
    cur.execute('SELECT version();')
    db_version = cur.fetchone()
    print(f"PostgreSQL database version: {db_version[0]}")
    # Close connections
    cur.close()
    conn.close()
    print("PostgreSQL connection is closed.")
  else:
    print("Failed to connect to PostgreSQL.")

if __name__ == "__main__":
  main()