from apiflask import APIBlueprint

bp = APIBlueprint('login', __name__)

from app.login import routes