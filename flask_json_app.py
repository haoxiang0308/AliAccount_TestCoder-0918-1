from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/api/data', methods=['GET'])
def get_data():
    # Sample JSON data
    data = {
        'message': 'Hello, World!',
        'status': 'success',
        'data': {
            'id': 123,
            'name': 'Sample Data',
            'items': ['item1', 'item2', 'item3']
        }
    }
    return jsonify(data)

@app.route('/', methods=['GET'])
def home():
    return jsonify({'message': 'Welcome to the Flask JSON API'})

if __name__ == '__main__':
    app.run(debug=True)