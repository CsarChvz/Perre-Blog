import os 
from app import create_app, db
from app.models import User, Role, Permission
from flask_migrate import Migrate
import click


app = create_app('default')
migrate = Migrate(app, db)


@app.shell_context_processor
def make_shell_context():
    return dict(db=db, User=User, Role=Role, Permission=Permission)

@app.cli.command()
@click.option('--length', default=25,
    help='Number of functions to include in the profiler report.')

@click.option('--profile-dir', default=None,
    help='Directory where profiler data files are saved.')
def profile(length, profile_dir):
    """Start the application under the code profiler."""
    from werkzeug.middleware.profiler import ProfilerMiddleware
    app.wsgi_app = ProfilerMiddleware(app.wsgi_app, restrictions=[length],
    profile_dir=profile_dir)
    app.run(debug=False)