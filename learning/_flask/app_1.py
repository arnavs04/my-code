# Understanding the Basic Skeleton of Flask App

from flask import Flask


app = Flask(__name__) 
# Initialize Flask Application (WSGI object)
# It will communicate with server


@app.route('/') 
# Main webpage
# This is a decorater and it takes 2 parameters rule and options
# Rule and Option says the URL /
# Basically says whenever we go to this URL (in parameters of app route) then the below 'binding' functions get executed/triggered automatically
def welcome(): # Binding function
    return "thinking is for free"


@app.route('/members') # Different URL
def members(): # we cant write same function even in different decorators so we change welcome() to members()
    return "thinking is for free"


##################################################################################################################################

if __name__ == '__main__':
    app.run(debug = True) # Different parameters like host, port, etc.

# Default port is 5000
# If we write debug = True then it automatically restarts server when changes are made






