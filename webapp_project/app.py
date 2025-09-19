from flask import Flask
import psycopg2
import os

app = Flask(__name__)

@app.route('/')
def hello():
    # Attempt to connect to the database
    try:
        conn = psycopg2.connect(os.environ.get('DATABASE_URL'))
        conn.close()
        return "Hello! Successfully connected to the database."
    except Exception as e:
        return f"Hello! But failed to connect to the database: {e}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)