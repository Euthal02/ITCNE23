from apiflask import Schema
from apiflask.fields import String, Integer
from apiflask.validators import Length, Email

from app.extensions import db

# define the user table
class UsersModel(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(128))
    email = db.Column(db.String(128), unique=True)
    password = db.Column(db.String(256))

# define the schema for the user input
class UsersIn(Schema):
    name = String(required=True, validate=Length(0, 128))
    email = String(required=True, validate=[Length(0, 128), Email()])
    password = String(required=True, validate=Length(0, 256))

# define the schema for the output
class UsersOut(Schema):
    id = Integer()
    name = String()
    password = String()
