from flask_mail import Mail, Message
from . import mail
from flask import current_app, render_template
from threading import Thread

def send_async_email(app, msg):
    with app.app_context():
        mail.send(msg)


def send_email(to, subject, template, **kwargs):
    app = current_app._get_current_object()
    msg = Message('Prefix' + subject,
    sender='cesar.chavez8728@alumnos.udg.mx', recipients=[to])
    msg.body = render_template(template + '.txt', **kwargs)
    msg.html = render_template(template + '.html', **kwargs)
    #thr = Thread(target=send_async_email, args=[app, msg])
    #msg.body = 'si'
    #msg.html = 'si'
    thr = Thread(target=send_async_email, args=[app, msg])
    thr.start()
    return thr
# Configuración de la base de datos
#Modelos para base de datos