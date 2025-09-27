import psycopg2
from psycopg2 import sql

def connect_to_db():
  """Connects to the PostgreSQL database."""
  try:
    # Replace these with your actual database credentials
    connection = psycopg2.connect(
        user="your_username",
        password="your_password",
        host="your_host",  # e.g., 'localhost' or an IP address
        port="5432",       # default PostgreSQL port
        database="your_database_name"
    )

    cursor = connection.cursor()
    # Print PostgreSQL Connection properties
    print(connection.get_dsn_parameters(), "\n")

    # Print PostgreSQL version
    cursor.execute("SELECT version();")
    record = cursor.fetchone()
    print("You are connected to - ", record, "\n")

    return connection, cursor

  except (Exception, psycopg2.OperationalError) as error:
    print(f"Error while connecting to PostgreSQL: {error}")
    return None, None

def close_db_connection(connection, cursor):
  """Closes the database connection."""
  if cursor:
    cursor.close()
  if connection:
    connection.close()
    print("PostgreSQL connection is closed")

if __name__ == "__main__":
  conn, cur = connect_to_db()
  if conn and cur:
    # Perform database operations here
    # Example: cur.execute("SELECT * FROM your_table;")
    close_db_connection(conn, cur)
