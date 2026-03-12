from flask import Flask, jsonify
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def get_time():
    # Gets current time in HH:MM:SS format
    now = datetime.now().strftime("%H:%M:%S")
    return jsonify({
        "project": "Devop-project",
        "status": "online",
        "current_time": now
    })

if __name__ == '__main__':
    # We use 0.0.0.0 so it's accessible outside the container
    app.run(host='0.0.0.0', port=5000)