ARG JUPYTER_VERSION=latest
FROM jupyter/minimal-notebook:${JUPYTER_VERSION}

USER root

##############################################################
# MANDATORY FOR ZSCALER - Include Zscaler cert in /jupyter directory
# Found here: https://confluence.cbsels.com/display/TEN/SSL+encryption%3A+Application%2C+Development+Environment%2C+and+Guest+OS+compatibility+requirements
##############################################################
# Zscaler Root Intermediate CA Cert - THIS WILL BE REQUIRED FOR BUILDING & RUNNING ON RELX WINDOWS HOSTS!
ARG ZSCALER_CA_CERT="ZscalerRootCertificate-2048-SHA256.crt"
# Zscaler Cert CopyTo Path Inside Container
ARG ZSCALER_CA_PATH="/usr/local/share/ca-certificates"
# Local CA Certs TrustStore Location inside Container runtime - Zscaler Cert will be imported here, so we need to for its use!
ARG REQUESTS_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"
# Copy Zscaler Cert into the directory in our Container
COPY ${ZSCALER_CA_CERT} ${ZSCALER_CA_PATH}/${ZSCALER_CA_CERT}
# Run update-ca-certificates utility to import the Zscaler certificate into Container TrustStore at runtime...
RUN ls -latr ${ZSCALER_CA_PATH}/ && ls -latr ${REQUESTS_CA_BUNDLE} && update-ca-certificates \
# Set REQUESTS_CA_BUNDLE env variable so that when we install python and py-pip it will use our custom certs bundle instead of its own...
&& export REQUESTS_CA_BUNDLE=${REQUESTS_CA_BUNDLE}
##############################################################

ARG CONDA_ENV=kd-playground

# Build environment
# conda update -n base conda
COPY --chown=${NB_UID}:${NB_GID} environment.yml /home/${NB_USER}/tmp/
RUN cd /home/${NB_USER}/tmp/ && \
    conda update -n base conda && \
    conda env create -p ${CONDA_DIR}/envs/${CONDA_ENV} -f environment.yml && \
    conda clean --all -f -y

# Link environment to jupyter
RUN ${CONDA_DIR}/envs/${CONDA_ENV}/bin/python -m ipykernel install --user --name=${CONDA_ENV} && \
    fix-permissions ${CONDA_DIR} && \
    fix-permissions /home/${NB_USER}

# Prepend conda environment to path
ENV PATH ${CONDA_DIR}/envs/${CONDA_ENV}/bin:${PATH}

# Make CONDA_ENV the default environment
ENV CONDA_DEFAULT_ENV ${CONDA_ENV}

# Run jupyter lab
CMD ["jupyter", "lab"]

# Set working directory
WORKDIR /playground

# Copy notebooks and conf scripts into the image
COPY /notebooks /notebooks
COPY /conf/jupyter_notebook_config.py /root/.jupyter/

# Switch back to NB_User, not accidentally running on root.
USER ${NB_USER}