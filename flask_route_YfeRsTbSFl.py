from flask import Flask, jsonify
import random
import string

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    # Generate a random string for the filename concept
    random_id = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    data = {
        "id": random_id,
        "message": "Hello, this is your JSON data!",
        "status": "success"
    }
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)