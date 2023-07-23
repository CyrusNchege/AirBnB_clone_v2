#!/usr/bin/python3
"""Starts a flask web app"""

from flask import Flask
app = Flask(__name__)

@app.route("/", strict_slashes=False)
def home():
    return "Hello HBNB!"

@app.route("/hbnb", strict_slashes=False)
def hbnb():
    return "HBNB"
@app.route("/c/<text>", strict_slashes=False)
def c(text):
    return "C {}".format(text.replace("_", " "))

@app.route('/python', strict_slashes=False)
@app.route('/python/<string:text>', strict_slashes=False)
def python_text(text="is cool"):
    """prints Python is cool"""
    text = text.replace("_", " ")
    return "Python %s" % text

@app.route('/number/<int:n>', strict_slashes=False)
def number(n):
    """prints n is a number if n is an integer"""
    return "%d is a number" % n

if __name__ == "__main__":
    app.run(host="0.0.0.0", port="5000")