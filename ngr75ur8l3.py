import mysql.connector
import random
import string

def execute_mysql_select():
    """
    Connect to MySQL database and execute a SELECT query
    """
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
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    execute_mysql_select()
