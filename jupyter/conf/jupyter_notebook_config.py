import os

c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.port = 8888
c.NotebookApp.open_browser = False
c.NotebookApp.allow_root = True
c.NotebookApp.notebook_dir = '/playground/notebooks'

# Insecure, but only locally available.
c.NotebookApp.password = ''
c.NotebookApp.token = ''

c.IPKernelApp.matplotlib = 'inline'
