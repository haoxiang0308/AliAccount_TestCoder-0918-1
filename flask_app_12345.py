from flask import Flask, jsonify
import json
import random
import string

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    """A route that returns JSON data"""
    sample_data = {
        "id": random.randint(1, 1000),
        "name": "Sample Item",
        "description": "This is a sample item returned as JSON",
        "status": "active",
        "tags": ["sample", "json", "flask"]
    }
    return jsonify(sample_data)

@app.route('/', methods=['GET'])
def home():
    """Home route"""
    return jsonify({"message": "Welcome to the Flask JSON API!"})

if __name__ == '__main__':
    app.run(debug=True)