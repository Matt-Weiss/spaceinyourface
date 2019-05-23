from skyfield.api import load
from skyfield.api import Topos
from flask import Flask, url_for
import json



app = Flask(__name__)

@app.route('/', methods=['GET'])
def home():
    return json.dumps('This is the Skyfield-JSON api, an open source project built at Turing School of Software and Design')

@app.route('/decra', methods =['GET'])
def declination_right_ascention():
    return json.dumps('')

@app.route('/azel', methods=['GET'])
def azimnuth_elevation():
    return json.dumps('')

if __name__ == '__main__':
    app.run()
