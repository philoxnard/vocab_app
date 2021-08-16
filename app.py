from json import *
from flask import Flask, render_template, request, jsonify

app = Flask(__name__)
app.secret_key = 'vnkdjnfjknfl1232#'

@app.route('/')
def hello():
    return render_template('index.html')

@app.route('/admin')
def admin():
    admin = True
    return render_template('admin.html', admin = admin)

@app.route('/notadmin')
def notadmin():
    admin = False
    return render_template('admin.html', admin = admin)

@app.route('/ajax_receive', methods=["GET", "POST"])
def ajax_receive():
    try:
        data = request.data
        string = str(data, "UTF-8")
        json = loads(string)
        # Here we'll have a handler function that takes json and unpacks it according to its command.
        # that handler function will then send some response back that gets returned here.
        # The app might not actually be complex enough to warrant this, but I wanted to practice
        # setting up an ajax sender/receiver/handler framework
        print(json)
        dump = dumps(json)
        return dumps(dump)
    except ValueError:
        return render_template('error.html')

if __name__ == "__main__":
    app.run(port=5000, debug=True)