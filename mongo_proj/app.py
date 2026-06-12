from flask import Flask, render_template, request, redirect, url_for
from pymongo import MongoClient
from dotenv import load_dotenv
import os

load_dotenv()

app = Flask(__name__)

client = MongoClient(os.getenv("MONGO_URI"))
db = client["todo_db"]
collection = db["todos"]


@app.route("/")
def home():
    return render_template("index.html")


@app.route("/submit", methods=["POST"])
def submit():

    try:
        item_name = request.form["item_name"]
        item_description = request.form["item_description"]

        collection.insert_one({
            "item_name": item_name,
            "item_description": item_description
        })

        return redirect(url_for("success"))

    except Exception as e:
        return render_template(
            "index.html",
            error=str(e)
        )


@app.route("/success")
def success():
    return render_template("success.html")


if __name__ == "__main__":
    app.run(debug=True)