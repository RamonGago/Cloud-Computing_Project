
from flask import Flask, jsonify
microservice = Flask(__name__)

@microservice.route("/")
def server_info():
    return jsonify({
        "server": "API REST"
    })

@microservice.status("/status")
def status_info():
    return jsonify({
        "status": "OK"
    })

if __name__ == "__main__":
    microservice.run(port=3000, host="0.0.0.0")
