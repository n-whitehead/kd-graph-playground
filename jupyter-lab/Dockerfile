FROM jupyter/scipy-notebook:latest

WORKDIR /jupyter-lab

# Workaround for verifying Zscaler cert -- change this
RUN conda config --set ssl_verify false

RUN conda install -c conda-forge \
    'py2neo=4.2.0' \
    'neo4j-python-driver=4.1.1' \
#    'tensorflow=1.13.1' \
#    'ampligraph'

COPY /notebooks /notebooks/

ENTRYPOINT ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0"]
