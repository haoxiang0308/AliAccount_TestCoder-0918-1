import psycopg2
from psycopg2 import sql

def connect_to_db():
    """
    Connects to the PostgreSQL database.

    IMPORTANT: This script assumes the database connection details are available
    as environment variables: DB_HOST, DB_NAME, DB_USER, DB_PASSWORD, DB_PORT.
    It's highly recommended to use environment variables or a secure config file
    for storing sensitive information like database credentials.
    """
    try:
        # Example connection string using environment variables (recommended)
        # conn = psycopg2.connect(
        #     host=os.environ['DB_HOST'],
        #     database=os.environ['DB_NAME'],
        #     user=os.environ['DB_USER'],
        #     password=os.environ['DB_PASSWORD'],
        #     port=os.environ.get('DB_PORT', 5432)  # Default PostgreSQL port
        # )

        # Placeholder connection - Replace these values with your actual database details
        # Or, better yet, load them from environment variables as shown above.
        conn = psycopg2.connect(
            host="localhost",      # Replace with your DB host
            database="mydb",       # Replace with your DB name
            user="myuser",         # Replace with your DB user
            password="mypass",     # Replace with your DB password
            port=5432              # Replace with your DB port if different
        )
        print("Connected to the database successfully!")
        return conn
    except psycopg2.OperationalError as e:
        print(f"Error connecting to database: {e}")
        return None

if __name__ == "__main__":
    connection = connect_to_db()
    if connection:
        cursor = connection.cursor()
        # Example query - replace with your actual query
        # cursor.execute(sql.SQL("SELECT version();"))
        # result = cursor.fetchone()
        # print(f"PostgreSQL version: {result[0]}")
        cursor.close()
        connection.close()
        print("Connection closed.")
    else:
        print("Could not establish a database connection. Exiting.")