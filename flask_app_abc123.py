from flask import Flask, jsonify
import json
import random
import string

app = Flask(__name__)

# Generate a random route name
random_route = '/' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

@app.route('/')
def home():
    return jsonify({
        'message': 'Welcome to the Flask app!',
        'available_routes': ['/', random_route, '/data']
    })

@app.route(random_route)
def random_endpoint():
    data = {
        'random_data': {
            'id': random.randint(1, 1000),
            'name': ''.join(random.choices(string.ascii_letters, k=10)),
            'value': round(random.random() * 100, 2),
            'status': random.choice(['active', 'inactive', 'pending'])
        }
    }
    return jsonify(data)

@app.route('/data')
def get_data():
    sample_data = {
        'users': [
            {'id': 1, 'name': 'Alice', 'email': 'alice@example.com'},
            {'id': 2, 'name': 'Bob', 'email': 'bob@example.com'},
            {'id': 3, 'name': 'Charlie', 'email': 'charlie@example.com'}
        ],
        'timestamp': '2023-06-15T10:30:00Z',
        'status': 'success'
    }
    return jsonify(sample_data)

if __name__ == '__main__':
    app.run(debug=True)