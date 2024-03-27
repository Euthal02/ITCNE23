from app.login import bp 
from app.extensions import db
from app.models.login import LoginIn, LoginOut
from app.models.users import UsersModel

from werkzeug.security import check_password_hash
from apiflask import abort as flask_abort
from sqlalchemy.exc import NoResultFound as sql_404

# login is root
@bp.post('/')
@bp.input(LoginIn, location='json')
@bp.output(LoginOut, status_code=201)
def login_with_email_and_password(json_data, database_table=UsersModel):
    given_email = json_data["email"]
    given_password = json_data["password"]
    try:
        user = db.session.execute(db.select(database_table).filter_by(email=given_email)).scalar_one()
        if check_password_hash(user.password, given_password):
            return user
        else:
            flask_abort(403, "Password Incorrect!")
    except sql_404 as error_message:
        flask_abort(404, "User with E-Mail not found!")
