from flask import Flask
import psycopg2
import os

app = Flask(__name__)

# Database connection parameters
DATABASE_URL = os.environ.get('DATABASE_URL', 'postgresql://myuser:mypassword@localhost:5432/mydatabase')

@app.route('/')
def hello():
    try:
        # Attempt to connect to the database
        conn = psycopg2.connect(DATABASE_URL)
        conn.close()
        return "Hello! Successfully connected to the database."
    except Exception as e:
        return f"Hello! But there was an error connecting to the database: {str(e)}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)