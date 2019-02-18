from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
from flask_mail import Mail

with open('config.json','r') as c:
        params=json.load(c)["params"]
local_server=True

app = Flask(__name__)

app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD=  params['gmail-password']
)

mail=Mail(app)

if(local_server):
        app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri'] #mysql+pymysql://root:@localhost/codingthunder'
else:
     app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']   
db = SQLAlchemy(app)


class Contacts(db.Model):
   
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    mes = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)

@app.route("/")
def home():
    return render_template('index.html',params=params)


@app.route("/dashbord")
def about():
    return render_template('login.html',params=params)

@app.route("/about")
def dashbord():
    return render_template('about.html',params=params)


@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, phone_num = phone, mes = message, date= datetime.now(),email = email )
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name,
                        sender=email,
                        recipients = [params['gmail-user']],
                        body = message + "\n" + phone
                        )

    return render_template('contact.html',params=params)


app.run(debug=True)
