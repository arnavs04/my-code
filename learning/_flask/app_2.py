# Building URL Dynamically
# Variable Rules & URL Building

from flask import Flask, redirect, url_for
# as the name suggests redirect redirects to a different page

## url_for
# The url_for() method, is used to prepare a URL, for a function dynamically, such that, changing URLs, in the application, is avoided. 
# It accepts, the name of the view function, as the first argument, and, any number of keywords, to be sent(to the view function), 
# as the second argument. 
# Syntax: url_for(‘<function_name>’,<key> = <value>)

app = Flask(__name__) 



@app.route('/') 
def welcome(): 
    return "thinking is for free"

@app.route('/success/<int:score>') # What we are doing is inputting or appending is score wth datatype (int)
def success(score): 
    return "The person has passed and the marks is " + str(score)

@app.route('/fail/<int:score>')
def fail(score): 
    return "The person has failed and the marks is " + str(score)

@app.route('/results/<int:score>')
def results(score):
    result = "success"
    if score < 50:
        result = "fail"
    return result

@app.route('/resultsredirect/<int:marks>') # Marks for this page, Score for other page
def resultsredirect(marks):
    marks = "sucess"
    if marks < 50:
        result = "fail"
    return redirect(url_for(result, score = marks))


if __name__ == '__main__':
    app.run(debug = True) 