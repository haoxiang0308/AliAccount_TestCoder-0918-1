import mysql.connector

# Database connection configuration
config = {
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',
    'database': 'your_database',
    'raise_on_warnings': True
}

# Establishing connection
try:
    connection = mysql.connector.connect(**config)
    
    if connection.is_connected():
        print("Successfully connected to MySQL database")
        
        # Creating cursor object
        cursor = connection.cursor()
        
        # Executing SELECT query
        query = "SELECT * FROM your_table"
        cursor.execute(query)
        
        # Fetching all rows
        records = cursor.fetchall()
        
        print(f"Total number of rows: {cursor.rowcount}")
        
        # Printing rows
        for row in records:
            print(row)
            
except mysql.connector.Error as e:
    print(f"Error while connecting to MySQL: {e}")
    
finally:
    # Closing database connection
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")