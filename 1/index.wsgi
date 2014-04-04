import sae
from evea import wsgi

application = sae.create_wsgi_app(wsgi.application)
