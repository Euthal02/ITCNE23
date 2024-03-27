from apiflask import Schema
from apiflask.fields import String, Integer
from apiflask.validators import Length, Email

# define the schema for the user input
class LoginIn(Schema):
    email = String(required=True, validate=[Length(0, 128), Email()])
    password = String(required=True, validate=Length(0, 256))

# define the schema for the output
class LoginOut(Schema):
    id = Integer()
    email = String()
    password = String()
    token = String()
