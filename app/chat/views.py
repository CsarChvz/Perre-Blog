from flask import render_template
from . import chat
from flask_login import current_user, login_required
from .. import socketio
from flask_socketio import emit

@chat.route('/')
def index():
    return render_template("chat/index.html")

# Socket Io
@chat.route('/chat')
@login_required
def chat():
    return render_template('chat.html')

@socketio.on('connect', namespace='/chat')
def on_connect():
    if current_user.is_anonymous:
        return False
    emit('welcome', {'username': current_user.id})
    
@socketio.on('disconnect', namespace='/chat')
def on_disconnect():
    if current_user.is_anonymus:
        return False
    emit('welcome', {'username': current_user.id})

@socketio.on('event')
def event(json):
    print("Estamos en evento"+json)
    emit('event', {'username': current_user.username})