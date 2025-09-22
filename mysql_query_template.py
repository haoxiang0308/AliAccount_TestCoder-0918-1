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
            database='test_db',
            user='root',
            password='password'
        )
        return connection
    except mysql.connector.Error as e:
        print(f"Error connecting to MySQL: {e}")
        return None

def execute_select_query(connection, query):
    """Execute a SELECT query and return results"""
    try:
        cursor = connection.cursor()
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Print column names
        column_names = [desc[0] for desc in cursor.description]
        print(" | ".join(column_names))
        print("-" * 50)
        
        # Print results
        for row in results:
            print(" | ".join(str(value) for value in row))
            
        cursor.close()
        return results
    except mysql.connector.Error as e:
        print(f"Error executing query: {e}")
        return None

def main():
    # Connect to database
    connection = connect_to_database()
    if not connection:
        return
    
    # Define query
    query = "SELECT * FROM users LIMIT 10"
    
    # Execute query
    print(f"Executing query: {query}")
    results = execute_select_query(connection, query)
    
    # Close connection
    connection.close()
    print("\nDatabase connection closed.")

if __name__ == "__main__":
    main()