from flask import Flask, redirect, url_for, render_template

app = Flask(__name__)

@app.get('/api')
def index():
    return 'Hello world'

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
