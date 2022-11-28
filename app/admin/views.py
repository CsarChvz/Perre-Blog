from . import admin
from flask import render_template, redirect, url_for, flash, request
from flask_login import login_required, current_user
from ..models import User, Role, Post, Permission, Comment
from ..decorators import admin_required, permission_required

@admin.route('/admin')
@login_required
@permission_required(Permission.ADMIN)
@admin_required
def admin():
    return render_template('admin/index.html')
