import psycopg2
from psycopg2 import sql

def connect_to_db():
    """Connects to the PostgreSQL database server."""
    conn = None
    try:
        # Connect to the PostgreSQL server
        conn = psycopg2.connect(
            host="localhost",          # Replace with your host
            database="your_database",  # Replace with your database name
            user="your_username",      # Replace with your username
            password="your_password"   # Replace with your password
        )
        print("Connected to the PostgreSQL database.")
        return conn
    except psycopg2.OperationalError as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return conn

def save_data(conn, data):
    """Saves data to a table in the database."""
    cur = conn.cursor()
    try:
        # Example: Insert data into a table called 'example_table'
        # Adjust the SQL query and table name as needed
        insert_query = sql.SQL("INSERT INTO example_table (column1, column2) VALUES (%s, %s);")
        cur.execute(insert_query, data)
        conn.commit()  # Commit the transaction
        print("Data saved successfully.")
    except psycopg2.Error as e:
        print(f"Error saving data: {e}")
        conn.rollback()  # Roll back the transaction on error
    finally:
        cur.close()

if __name__ == '__main__':
    connection = connect_to_db()
    if connection:
        # Example data to save
        example_data = ("value1", "value2")
        save_data(connection, example_data)
        connection.close()
        print("Connection closed.")
    else:
        print("Failed to establish a database connection.")