import psycopg2
from psycopg2 import sql

def connect_to_db():
    """Connects to the PostgreSQL database."""
    try:
        # Connection parameters - replace with your actual database details
        connection = psycopg2.connect(
            user="your_username",
            password="your_password",
            host="your_host",  # e.g., 'localhost' or an IP address
            port="5432",       # default PostgreSQL port
            database="your_database_name"
        )

        cursor = connection.cursor()
        # Print PostgreSQL version
        cursor.execute('SELECT version();')
        db_version = cursor.fetchone()
        print(f"Connected to PostgreSQL database. Version: {db_version[0]}")

        return connection, cursor

    except (Exception, psycopg2.Error) as error:
        print(f"Error while connecting to PostgreSQL: {error}")
        return None, None

def close_db_connection(connection, cursor):
    """Closes the database connection and cursor."""
    if cursor:
        cursor.close()
    if connection:
        connection.close()
    print("PostgreSQL connection is closed.")

# Example usage
if __name__ == "__main__":
    conn, cur = connect_to_db()
    if conn and cur:
        # Perform database operations here
        # For example, fetching data from a table:
        # cur.execute("SELECT * FROM your_table_name;")
        # records = cur.fetchall()
        # print(records)

        close_db_connection(conn, cur)