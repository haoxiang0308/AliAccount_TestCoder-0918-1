from flask import Flask, jsonify
import json
import random
import string

app = Flask(__name__)

@app.route('/api/data', methods=['GET'])
def get_json_data():
    """A route that returns JSON data"""
    # Create some sample JSON data
    data = {
        "id": random.randint(1, 1000),
        "name": "Sample Data",
        "description": "This is a sample JSON response from Flask",
        "items": [
            {"id": 1, "value": "item1"},
            {"id": 2, "value": "item2"},
            {"id": 3, "value": "item3"}
        ],
        "status": "success"
    }
    return jsonify(data)

@app.route('/', methods=['GET'])
def home():
    """Home route"""
    return jsonify({"message": "Flask app with JSON route is running!"})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)