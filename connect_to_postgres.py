import psycopg2
from psycopg2 import sql

def connect_to_db():
    """
    Connects to a PostgreSQL database using psycopg2.
    Replace the connection parameters with your actual database credentials.
    """
    try:
        # Replace these parameters with your actual database connection details
        connection = psycopg2.connect(
            user="your_username",
            password="your_password",
            host="your_host",  # e.g., "localhost" or an IP address
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

def close_connection(connection, cursor):
    """
    Closes the database connection and cursor.
    """
    if cursor:
        cursor.close()
    if connection:
        connection.close()
    print("PostgreSQL connection is closed")

# Example usage
if __name__ == "__main__":
    conn, cur = connect_to_db()
    if conn and cur:
        # Perform database operations here
        # For example, execute a query:
        # cur.execute("SELECT * FROM your_table;")
        # results = cur.fetchall()
        # print(results)
        close_connection(conn, cur)