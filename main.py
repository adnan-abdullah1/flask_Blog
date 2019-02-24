from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
from flask_mail import Mail


with open('config.json', 'r') as c:
    params = json.load(c)["params"]
local_server = True
app = Flask(__name__)
app.secret_key = 'SECRET-KEY'
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD=  params['gmail-password']
)
mail = Mail(app)
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


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    tagline = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)

@app.route("/")
def home():
    posts = Posts.query.filter_by().all()[0:params['no_of_posts']]
    return render_template('index.html', params=params, posts=posts)



@app.route("/admin",methods=['GET','POST'])
def admin():
    """
    if ('user' in session): #and session['user']==params['admin_user']):
    
        return render_template('dashbord.html')
        """
    if request.method=='POST':
        username=request.form.get('uname')
        userpass=request.form.get('pass')
        if(username==params['admin_user'] and userpass==params['admin_password']):
            sesssion['user']=username
            
            return render_template('dashbord.html', params=params)
    else:
        posts=Posts.query.all()
        return render_template('dashbord.html', params=params,posts=posts)


@app.route("/about")
def about():
    return render_template('about.html', params=params)


@app.route("/dashbord",methods=['GET','POST'])
def dashbord():
    if ('user' in session and session['user']==params['pasd']):
        return render_template('dashbord.html',params=params)
    if request.method=='POST':
        username=request.form.get('uname')
        userpass=request.form.get('pass')
        print('userpass')
        if( username==params['user_name'] and userpass==params['pasd']):
            session['user']=username
            
            posts=Posts.query.all()
           
            return render_template('dashbord.html', params=params,posts=posts)
    
        
    return render_template('login.html', params=params)





@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)


@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, phone_num = phone, mes = message, date= datetime.now(),email = email )
        db.Sesssion.add(entry)
        db.Sesssion.commit()
        mail.send_message('New message from ' + name,
                        sender=email,
                        recipients = [params['gmail-user']],
                        body = message + "\n" + phone
                        )

    return render_template('contact.html',params=params)

if __name__ == '__main__':
    
    app.run(port=5001,debug=True)
