import mysql.connector
import random
import string

def generate_random_string(length=8):
    """Generate a random string of specified length"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def connect_to_database():
    """Establish connection to MySQL database"""
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='testdb',
            user='your_username',
            password='your_password'
        )
        return connection
    except mysql.connector.Error as error:
        print(f"Error connecting to MySQL: {error}")
        return None

def execute_select_query(connection, query):
    """Execute a SELECT query and return results"""
    try:
        cursor = connection.cursor()
        cursor.execute(query)
        records = cursor.fetchall()
        cursor.close()
        return records
    except mysql.connector.Error as error:
        print(f"Error executing query: {error}")
        return None

def main():
    # Establish database connection
    connection = connect_to_database()
    if connection is None:
        return
    
    # Define your SELECT query
    query = "SELECT * FROM users LIMIT 10"
    
    # Execute the query
    results = execute_select_query(connection, query)
    
    if results is not None:
        print("Query executed successfully. Results:")
        for row in results:
            print(row)
    else:
        print("Failed to execute query.")
    
    # Close the connection
    connection.close()

if __name__ == "__main__":
    main()