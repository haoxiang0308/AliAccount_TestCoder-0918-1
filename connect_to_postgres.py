import psycopg2
from psycopg2 import sql

def connect_to_db():
  """
  Connects to a PostgreSQL database using psycopg2.

  Make sure to replace the connection parameters with your actual database details.
  """
  try:
    # Replace these connection parameters with your actual database details
    connection = psycopg2.connect(
        host="localhost",      # e.g., "localhost" or an IP address
        database="your_db_name",
        user="your_username",
        password="your_password",
        port=5432              # Default PostgreSQL port
    )

    cursor = connection.cursor()
    print("Connected to PostgreSQL database!")
    # Example query
    cursor.execute('SELECT version();')
    db_version = cursor.fetchone()
    print(f"PostgreSQL Database Version: {db_version[0]}")

    cursor.close()
    connection.close()
    print("PostgreSQL connection is closed.")

  except (Exception, psycopg2.Error) as error:
    print(f"Error while connecting to PostgreSQL: {error}")

if __name__ == "__main__":
    connect_to_db()