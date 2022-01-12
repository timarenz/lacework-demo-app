import urllib
import platform
import random
import requests
import os
from flask import Flask, render_template, url_for, request
from flask import jsonify

app = Flask(__name__)

event_text = "Lacework Container Security"
tweet_text = "Hello from the Container Security Lunchinar. Just enjoyed a fantastic presentation from @timarenz about Container Security with #laceworks #devsecops #shiftleft"


@app.route('/')
def index():
    images = [
        url_for('static', filename='beachops-1.png'),
        url_for('static', filename='beachops-2.png'),
        url_for('static', filename='norules-1.png'),
        url_for('static', filename='norules-2.png'),
    ]
    url = random.choice(images)
    hostname = platform.node()
    random_cocktail = requests.get(
        'https://www.thecocktaildb.com/api/json/v1/1/random.php').json()
    return render_template('index.html', url=url, hostname=hostname, event_text=event_text, tweet_text=tweet_text, tweet_text_url=urllib.parse.quote(tweet_text), ip=request.remote_addr, cocktail=random_cocktail['drinks'][0]['strDrink'])


@app.route("/ip")
def ip():
    return jsonify({'ip': request.remote_addr}), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0")
