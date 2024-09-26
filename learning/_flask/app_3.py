# Integrate HTML with Flask
# HTTP Verb GET and POST


from flask import Flask, redirect, url_for, render_template, request

app = Flask(__name__) 

##################################################################################################################################


@app.route('/') 
def welcome(): 
    return render_template('index_1.html') # Make sure the html file is in the folder 'templates' otherwise it wont work
    # We always need to return something in flask

@app.route('/success/<int:score>')
def success(score):
    res = ""
    if score >= 50:
        res = "PASS"
    else:
        res = 'FAIL'
    return render_template('result_1.html', result = res)

@app.route('/fail/<int:score>')
def fail(score): 
    return "The person has failed and the marks is " + str(score)

# Result checker submit html file
@app.route('/submit', methods = ['POST', 'GET'])
def submit(score): 
    total_score = 0


    if request.method == 'POST':
        science = float(request.form['science'])
        maths = float(request.form['maths'])
        c = float(request.form['c'])
        data_science = float(request.form['datascience'])
        total_score = (science + maths + c + data_science) / 4


    result = "fail"
    if total_score > 50:
        result = "success"
    return redirect(url_for(result, score = total_score))

##################################################################################################################################

if __name__ == '__main__':
    app.run(debug = True) 