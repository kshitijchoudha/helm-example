from flask import Flask
app = Flask(__name__)

@app.route('/helm')
def hello_world():
    return 'Hello, Helm!!'

@app.route('/')
def hello_root():
    return 'Hello! Helm!!!'