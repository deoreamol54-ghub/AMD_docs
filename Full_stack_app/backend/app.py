from flask import Flask, request

app = Flask(__name__)

@app.route("/process", methods=["POST"])
def process():

    name = request.form.get("name")
    email = request.form.get("email")

    return f"""
    <h2>Data Received</h2>

    Name: {name}<br>
    Email: {email}
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)