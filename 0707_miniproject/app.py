import re
from flask import Flask, request, render_template, jsonify
import time
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
import seaborn as sns
from crawler import Crawling


app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False

@app.route("/", methods=["get"])
def get():
    return render_template("index.html")

@app.route("/getdata", methods=["get"])
def getdata():
    Crawling.crawl_exel()
    return ''

@app.route("/g1", methods=["get"])
def visualize1():
    Crawling.visual1()
    return ''

@app.route("/g2", methods=["get"])
def visualize2():
    Crawling.visual2()
    return ''

@app.route("/g3", methods=["get"])
def visualize3():
    Crawling.visual3()
    return ''

if __name__ == "__main__":
    app.run(debug=True, host="127.0.0.1", port="5000")
