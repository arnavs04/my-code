### Integrate HTML With Flask
### HTTP verb GET And POST

## Jinja2 template engine

# Jinja2 is a popular templating engine for Python web frameworks, including Flask.
# In Flask, Jinja2 is the default templating engine used for rendering HTML pages dynamically.

# Jinja2 allows you to embed Python code within HTML templates, enabling you to generate dynamic content easily.
# It provides features such as template inheritance, macros, loops, conditions, and filters, making it powerful for building dynamic web applications.

# In Flask, you typically create HTML templates in the 'templates' directory of your Flask application.
# You can then use Jinja2 syntax within these templates to insert dynamic content, loop through data, conditionally display elements, and more.

'''
{%...%} conditions,for loops
{{    }} expressions to print output
{#....#} this is for comments
'''

from flask import Flask, redirect, url_for, render_template, request

app = Flask(__name__)

##################################################################################################################################

@app.route('/')
def welcome():
    return render_template('index_2.html')

@app.route('/success/<int:score>')
def success(score):
    res = ""
    if score >= 50:
        res = "PASS"
    else:
        res = 'FAIL'
    exp = {'score': score,'res': res}
    return render_template('result_2.html',result=exp)


### Result checker submit html page
@app.route('/submit',methods=['POST','GET'])
def submit():
    total_score=0
    if request.method=='POST':
        science=float(request.form['science'])
        maths=float(request.form['maths'])
        c=float(request.form['c'])
        data_science=float(request.form['datascience'])
        total_score=(science+maths+c+data_science)/4
    res=""
    return redirect(url_for('success',score=total_score))

##################################################################################################################################

if __name__=='__main__':
    app.run(debug=True)