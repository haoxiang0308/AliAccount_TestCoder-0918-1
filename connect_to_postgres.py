import psycopg2
from psycopg2 import sql

def connect_to_db():
  """Connects to a PostgreSQL database and prints the connection status."""
  try:
    # Replace these connection details with your actual database credentials
    connection = psycopg2.connect(
        host="localhost",      # e.g., localhost, or an IP address
        database="your_db_name",
        user="your_username",
        password="your_password",
        port=5432              # Default PostgreSQL port
    )

    cursor = connection.cursor()
    print("Successfully connected to PostgreSQL database!")
    
    # Example query to get PostgreSQL version
    cursor.execute('SELECT version();')
    db_version = cursor.fetchone()
    print(f"PostgreSQL database version: {db_version[0]}")

  except psycopg2.OperationalError as e:
    print(f"Error connecting to PostgreSQL: {e}")
  except psycopg2.Error as e:
    print(f"A database error occurred: {e}")
  finally:
    # Close the cursor and connection
    if cursor:
        cursor.close()
    if connection:
        connection.close()
        print("PostgreSQL connection is closed.")

if __name__ == "__main__":
    connect_to_db()