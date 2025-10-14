import mysql.connector
import os

# Database connection details
config = {
    'user': os.getenv('MYSQL_USER', 'root'),
    'password': os.getenv('MYSQL_PASSWORD', 'password'),
    'host': os.getenv('MYSQL_HOST', 'localhost'),
    'database': os.getenv('MYSQL_DATABASE', 'testdb'),
    'raise_on_warnings': True
}

def execute_select_query(query):
    """Connects to the database, executes a SELECT query, and prints the results."""
    try:
        # Establish connection
        cnx = mysql.connector.connect(**config)
        cursor = cnx.cursor()

        # Execute the query
        cursor.execute(query)

        # Fetch all results
        rows = cursor.fetchall()

        # Get column names
        column_names = [i[0] for i in cursor.description]

        # Print column names
        print(", ".join(column_names))
        print("-" * 40)

        # Print each row
        for row in rows:
            print(", ".join(map(str, row)))

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        # Close connections
        if cursor:
            cursor.close()
        if cnx:
            cnx.close()

if __name__ == "__main__":
    # Example SELECT query
    select_query = "SELECT * FROM your_table_name LIMIT 5;"
    execute_select_query(select_query)
