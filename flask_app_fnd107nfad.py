from flask import Flask, jsonify
import random
import string

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({
        'message': 'Welcome to the Flask app!',
        'endpoints': ['/', '/api/data', '/random']
    })

@app.route('/api/data')
def get_data():
    data = {
        'products': [
            {'id': 1, 'name': 'Laptop', 'price': 999.99},
            {'id': 2, 'name': 'Mouse', 'price': 29.99},
            {'id': 3, 'name': 'Keyboard', 'price': 79.99}
        ],
        'total_count': 3,
        'status': 'success'
    }
    return jsonify(data)

@app.route('/random')
def get_random_data():
    random_data = {
        'id': random.randint(1, 1000),
        'title': ''.join(random.choices(string.ascii_letters, k=12)),
        'value': round(random.random() * 100, 2),
        'tags': random.sample(['tech', 'gaming', 'office', 'home'], 2)
    }
    return jsonify(random_data)

if __name__ == '__main__':
    app.run(debug=True)