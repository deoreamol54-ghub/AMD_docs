#!/bin/bash

dnf update -y

curl -fsSL https://rpm.nodesource.com/setup_20.x | bash -

dnf install -y nodejs

mkdir -p /opt/frontend

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

nohup node server.js > /tmp/express.log 2>&1 &