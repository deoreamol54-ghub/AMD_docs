#!/bin/bash

dnf update -y

dnf install -y git python3

curl -fsSL https://rpm.nodesource.com/setup_20.x | bash -

dnf install -y nodejs

pip3 install flask

mkdir -p /opt/backend
mkdir -p /opt/frontend

cat <<EOF > /opt/backend/app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Flask Backend Running"

app.run(host='0.0.0.0', port=5000)
EOF

nohup python3 /opt/backend/app.py > /opt/backend/flask.log 2>&1 &

cat <<EOF > /opt/frontend/server.js
const express = require('express');

const app = express();

app.get('/', (req,res)=>{
  res.send('Express Frontend Running');
});

app.listen(3000,'0.0.0.0');
EOF

cd /opt/frontend

npm init -y

npm install express

nohup node server.js > /opt/frontend/express.log 2>&1 &