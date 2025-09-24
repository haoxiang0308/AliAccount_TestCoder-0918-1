from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/api/data', methods=['GET'])
def get_data():
    sample_data = {
        "message": "Hello from the Flask API!",
        "status": "success",
        "data": {
            "item_id": 123,
            "name": "Sample Item",
            "value": 42
        }
    }
    return jsonify(sample_data)

if __name__ == '__main__':
    app.run(debug=True)