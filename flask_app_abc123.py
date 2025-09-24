from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/api/data')
def get_data():
    """A simple route that returns JSON data."""
    data = {
        "message": "Hello from the Flask API!",
        "status": "success",
        "data": {
            "item1": "value1",
            "item2": "value2"
        }
    }
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)