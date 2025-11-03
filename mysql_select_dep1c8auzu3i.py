import mysql.connector
from mysql.connector import Error

def execute_select_query():
    """Executes a SELECT query on MySQL database"""
    try:
        # Database connection parameters - update these with your actual database credentials
        connection = mysql.connector.connect(
            host='localhost',  # or your MySQL server address
            database='your_database_name',  # replace with your database name
            user='your_username',  # replace with your MySQL username
            password='your_password'  # replace with your MySQL password
        )
        
        if connection.is_connected():
            cursor = connection.cursor()
            
            # Example SELECT query - modify this query as needed
            select_query = "SELECT * FROM your_table_name LIMIT 10;"  # replace with your table name
            
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            print(f'Total number of records: {cursor.rowcount}')
            print('Records:')
            for row in records:
                print(row)
                
    except Error as e:
        print(f'Error while connecting to MySQL: {e}')
        
    finally:
        # Close the database connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            print('MySQL connection is closed')

if __name__ == "__main__":
    print('Executing MySQL SELECT query...')
    execute_select_query()
