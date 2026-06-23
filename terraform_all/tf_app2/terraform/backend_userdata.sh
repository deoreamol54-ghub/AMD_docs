#!/bin/bash

dnf update -y

dnf install -y python3 python3-pip

python3 -m pip install flask

mkdir -p /opt/backend

cat <<EOF > /opt/backend/app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Flask Backend Running"

app.run(host='0.0.0.0', port=5000)
EOF

nohup python3 /opt/backend/app.py > /tmp/flask.log 2>&1 &