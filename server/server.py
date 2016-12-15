
import hashlib
import base64
from flask import Flask,render_template,request,make_response
from flask_socketio import SocketIO,Namespace,emit,send

app = Flask(__name__)
app.config['SECRET_KEY'] = '**(^&&*%^^&%$%^secret!!!!'
#app.secret_key = app.config['SECRET_KEY'']
socketio = SocketIO(app,logger=True)


USERS = {}
MESSAGES = []


@app.route('/')
def index():
    return "Hello"

@socketio.on_error()
def handle_error(e):
    print('An error has occurred: ' + str(e)) 


@socketio.on('join')
def on_name(msg):
    print('join from ' + request.sid)
    print('namespace ' + request.namespace)
    print('event ' + str(request.event))
    name = msg['text']
    USERS[request.sid] = name
    emit('messages',{'messages':MESSAGES})
    emit('joined',{'result':True})
    emit('adduser',{'name':True},broadcast = True)

@socketio.on('hi')
def hi(msg):
    print('hi from ' + request.sid)
    print('namespace ' + request.namespace)
    print('event ' + str(request.event))
    
    name = USERS[request.sid]
    data = {'name':name,'message':msg['message']}
    MESSAGES.append(data)
    emit('onmessage',data)

@socketio.on('connect')
def connect():
    print('connect' + request.sid)
    print('name:' + request.namespace)
    print('event' + str(request.event))
    ##socketio.on
    #socketio.send("connected you to me",broadcast=True);
    #socketio.emit('hi',{'data':"Connected"},namespace='/test')

@socketio.on('disconnect')
def test_disconnect():
    print('Client Disconnected')


@socketio.on_error()        # Handles the default namespace
def error_handler(e):
    print e

def main():
    socketio.run(app,host='0.0.0.0',port=3301,debug=True,log_output=True)

if __name__ == '__main__':
    main()
