from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    sample_data = {
        "message": "Hello, this is your JSON data!",
        "items": ["item1", "item2", "item3"],
        "status": "success"
    }
    return jsonify(sample_data)

if __name__ == '__main__':
    app.run(debug=True)