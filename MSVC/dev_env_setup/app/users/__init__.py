from apiflask import APIBlueprint

bp = APIBlueprint('student', __name__)

from app.users import routes