from app.users import bp 
from app.extensions import db
from werkzeug.security import generate_password_hash

from app.models.users import UsersModel, UsersIn, UsersOut

# get all users
@bp.get('/')
@bp.output(UsersOut(many=True))
def view_users(database_table=UsersModel):
    return database_table.query.all()

# get user by id
@bp.get('/<int:user_id>')
@bp.output(UsersOut)
def view_user_by_id(user_id, database_table=UsersModel):
    user = db.get_or_404(database_table, user_id)
    return user

# create new user
@bp.post('/create')
@bp.input(UsersIn, location='json')
@bp.output(UsersOut, status_code=201)
def create_user(json_data, database_table=UsersModel):
    modified_json = {
        "name": json_data["name"],
        "email": json_data["email"],
        "password": generate_password_hash(json_data["password"])
    }
    user = database_table(**modified_json)
    db.session.add(user)
    db.session.commit()
    return user

# change the information for a db entry
@bp.patch('/<int:user_id>/edit')
@bp.input(UsersIn(partial=True), location='json')
@bp.output(UsersOut)
def update_user(user_id, json_data, database_table=UsersModel):
    user = db.get_or_404(database_table, user_id)
    for key, value in json_data.items():
        insert_data = value
        if key == "password":
            insert_data = generate_password_hash(value)
        setattr(user, key, insert_data)
    db.session.commit()
    return user

# remove user by id
@bp.delete('/<int:user_id>/remove')
@bp.output(UsersOut)
def delete_user(user_id, database_table=UsersModel):
    user = db.get_or_404(database_table, user_id)
    db.session.delete(user)
    db.session.commit()
    return user
