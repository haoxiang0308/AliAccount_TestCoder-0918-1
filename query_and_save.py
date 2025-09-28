import pandas as pd
from sqlalchemy import create_engine
import random
import string

# Read CSV files
users_df = pd.read_csv('users.csv')
orders_df = pd.read_csv('orders.csv')

# Create an in-memory SQLite database
engine = create_engine('sqlite:///:memory:')

# Write DataFrames to the database as tables
users_df.to_sql('users', con=engine, index=False, if_exists='replace')
orders_df.to_sql('orders', con=engine, index=False, if_exists='replace')

# Define the SQL query
query = """
SELECT u.name, u.email, o.order_id, o.product, o.amount
FROM users u
JOIN orders o ON u.user_id = o.user_id
ORDER BY u.name;
"""

# Execute the query and print the result
result_df = pd.read_sql_query(query, con=engine)
print("Query Result:")
print(result_df)

# Generate a random filename
random_filename = 'query_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.sql'

# Save the query to the random file
with open(random_filename, 'w') as f:
    f.write(query)

print(f"\nSQL query saved to {random_filename}")