from flask import Blueprint
from ..models import Permission

chat = Blueprint('chat', __name__)

from . import views, errors

