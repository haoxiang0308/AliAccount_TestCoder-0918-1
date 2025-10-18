from flask import Flask, jsonify
import random
import string

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    """Route that returns JSON data"""
    data = {
        'id': random.randint(1, 1000),
        'name': 'Sample Data',
        'description': 'This is a sample JSON response from Flask',
        'status': 'success'
    }
    return jsonify(data)

@app.route('/', methods=['GET'])
def home():
    """Home route"""
    return jsonify({'message': 'Welcome to the Flask app!'})

if __name__ == '__main__':
    # Generate a random port number between 8000 and 9999
    port = random.randint(8000, 9999)
    print(f"Starting Flask app on port {port}")
    app.run(debug=True, host='0.0.0.0', port=port)