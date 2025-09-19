import mysql.connector

# Database connection configuration
config = {
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',
    'database': 'your_database',
    'raise_on_warnings': True
}

# Create connection
try:
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()
    
    # Execute SELECT query
    query = "SELECT * FROM your_table"
    cursor.execute(query)
    
    # Fetch and print results
    results = cursor.fetchall()
    for row in results:
        print(row)
        
except mysql.connector.Error as err:
    print(f"Error: {err}")
    
finally:
    # Close connections
    if 'cursor' in locals():
        cursor.close()
    if 'cnx' in locals() and cnx.is_connected():
        cnx.close()