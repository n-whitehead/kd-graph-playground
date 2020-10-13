import os

from IPython.lib import passwd

c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.port = 8888
c.NotebookApp.open_browser = False
c.NotebookApp.allow_root = True
c.NotebookApp.notebook_dir = '/playground/notebooks'

if 'PASSWORD' in os.environ:
    password = os.environ['PASSWORD']
    if password:
        c.NotebookApp.password = passwd(password)
    else:
        c.NotebookApp.password = ''
        c.NotebookApp.token = ''
    del os.environ['PASSWORD']
