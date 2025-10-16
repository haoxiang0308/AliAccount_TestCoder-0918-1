import mysql.connector
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def execute_mysql_select():
    """
    Connect to MySQL database and execute a SELECT query
    """
    connection = None
    try:
        # Establish connection to MySQL
        # Replace these connection parameters with your actual MySQL configuration
        connection = mysql.connector.connect(
            host='localhost',  # Replace with your MySQL host
            port=3306,         # Replace with your MySQL port if different
            database='your_database',  # Replace with your database name
            user='your_username',      # Replace with your MySQL username
            password='your_password'   # Replace with your MySQL password
        )
        
        cursor = connection.cursor()
        
        # Example SELECT query - replace with your actual table and columns
        select_query = "SELECT * FROM your_table LIMIT 10;"
        cursor.execute(select_query)
        
        # Fetch all records
        records = cursor.fetchall()
        
        # Print the records
        print("Records from the table:")
        for row in records:
            print(row)
            
        # Also print column names
        column_names = [i[0] for i in cursor.description]
        print(f"Column names: {column_names}")
        
    except mysql.connector.Error as error:
        print(f"Error while connecting to MySQL: {error}")
        
    finally:
        # Close connections
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

def save_script_to_random_file():
    """Save this script with a random filename"""
    # Get the content of this script
    script_content = '''import mysql.connector
import random
import string

def execute_mysql_select():
    """
    Connect to MySQL database and execute a SELECT query
    """
    connection = None
    try:
        # Establish connection to MySQL
        # Replace these connection parameters with your actual MySQL configuration
        connection = mysql.connector.connect(
            host='localhost',  # Replace with your MySQL host
            port=3306,         # Replace with your MySQL port if different
            database='your_database',  # Replace with your database name
            user='your_username',      # Replace with your MySQL username
            password='your_password'   # Replace with your MySQL password
        )
        
        cursor = connection.cursor()
        
        # Example SELECT query - replace with your actual table and columns
        select_query = "SELECT * FROM your_table LIMIT 10;"
        cursor.execute(select_query)
        
        # Fetch all records
        records = cursor.fetchall()
        
        # Print the records
        print("Records from the table:")
        for row in records:
            print(row)
            
        # Also print column names
        column_names = [i[0] for i in cursor.description]
        print(f"Column names: {column_names}")
        
    except mysql.connector.Error as error:
        print(f"Error while connecting to MySQL: {error}")
        
    finally:
        # Close connections
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    execute_mysql_select()
'''
    
    # Generate a random filename
    random_filename = generate_random_filename()
    full_path = f"/workspace/{random_filename}"
    
    # Write the script content to the randomly named file
    with open(full_path, 'w') as file:
        file.write(script_content)
    
    print(f"Script saved to randomly named file: {full_path}")
    return full_path

if __name__ == "__main__":
    # Save the script to a randomly named file
    random_file_path = save_script_to_random_file()
    
    # Execute the MySQL SELECT query
    execute_mysql_select()