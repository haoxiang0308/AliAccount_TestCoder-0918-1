import mysql.connector
import random
import string

def execute_mysql_select():
    """
    Executes a SELECT query on MySQL database
    """
    try:
        # Database connection parameters - these should be configured based on your setup
        config = {
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',  # or your MySQL server address
            'database': 'your_database',
            'raise_on_warnings': True
        }
        
        # Establish connection
        cnx = mysql.connector.connect(**config)
        cursor = cnx.cursor()
        
        # Example SELECT query - modify as needed
        query = "SELECT * FROM your_table LIMIT 10;"
        cursor.execute(query)
        
        # Fetch all results
        results = cursor.fetchall()
        
        # Print results
        for row in results:
            print(row)
            
        print(f"Query executed successfully. Retrieved {len(results)} rows.")
        
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        
    finally:
        # Close connections
        if cursor:
            cursor.close()
        if cnx:
            cnx.close()

if __name__ == "__main__":
    execute_mysql_select()