from flask import Blueprint
from ..models import Permission
admin = Blueprint('admin', __name__)

from . import views, errors