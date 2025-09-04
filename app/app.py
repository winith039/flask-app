from flask import Flask, render_template_string

app = Flask(__name__)

@app.route("/")
def home():
    return render_template_string("""
        <h1>Hello from Flask App 🚀</h1>
        <p>This is an updated version with an image!</p>
        <img src="{{ url_for('static', filename='DP.jpeg') }}" alt="Flask Logo" width="200">
    """)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)


