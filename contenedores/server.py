from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/status")
def server_info():
    return jsonify({
        status: "OK"
    })

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
