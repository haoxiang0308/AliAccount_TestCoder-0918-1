import psycopg2
from psycopg2 import sql

def connect_to_db():
  """
  Connects to the PostgreSQL database.
  Replace the connection parameters with your actual database credentials.
  """
  try:
    connection = psycopg2.connect(
        host="localhost",      # e.g., "localhost" or an IP address
        database="your_db_name",
        user="your_username",
        password="your_password",
        port=5432              # Default PostgreSQL port
    )
    return connection
  except psycopg2.Error as e:
    print(f"Error connecting to PostgreSQL: {e}")
    return None

def main():
  conn = connect_to_db()
  if conn:
    print("Successfully connected to the database!")
    # Perform your database operations here
    # For example, creating a cursor:
    # cursor = conn.cursor()
    # cursor.execute("SELECT version();")
    # result = cursor.fetchone()
    # print(result)
    # cursor.close()

    conn.close()
    print("Connection closed.")

if __name__ == "__main__":
    main()