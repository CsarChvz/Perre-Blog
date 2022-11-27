from random import randint
from sqlalchemy.exc import IntegrityError
from faker import Faker
from . import db
from .models import User, Role, Post, Comment, Permission, Follow

def users(count=100):
    fake = Faker()
    i = 0
    while i < count:
        u = User(email=fake.email(),
                 username=fake.user_name(),
                 password='password',
                 confirmed=True,
                 name=fake.name(),
                 location=fake.city(),
                 about_me=fake.text(),
                 member_since=fake.past_date())
        db.session.add(u)
        try:
            db.session.commit()
            i += 1
        except IntegrityError:
            db.session.rollback()

def posts(count=100):
    fake = Faker()
    user_count = User.query.count()
    for i in range(count):
        u = User.query.offset(randint(0, user_count - 1)).first()
        p = Post(body=fake.text(),
                 timestamp=fake.past_date(),
                 author=u)
        db.session.add(p)
    db.session.commit()

def comments(count=500):
    fake = Faker()
    user_count = User.query.count()
    post_count = Post.query.count()
    for i in range(count):
        u = User.query.offset(randint(0, user_count - 1)).first()
        p = Post.query.offset(randint(0, post_count - 1)).first()
        c = Comment(body=fake.text(),
                    timestamp=fake.past_date(),
                    disabled=fake.boolean(),
                    author=u,
                    post=p)
        db.session.add(c)
    db.session.commit()

def followers(count=500):
    user_count = User.query.count()
    for i in range(count):
        u = User.query.offset(randint(0, user_count - 1)).first()
        f = User.query.offset(randint(0, user_count - 1)).first()
        if f not in u.followed.all():
            u.follow(f)
    db.session.commit()

# No creo que sea necesario hacer un seed para los roles, ya que se crean
def roles():
    Role.insert_roles()
    db.session.commit()
