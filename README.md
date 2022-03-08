# Knowledge Discovery Graph Playground

This project aims to promote experimentation on a sample Knowledge Discovery (KD) graph subset. Running and tearing down the graph instance is meant to be quick on a local machine; with all data/environment setup handled on startup.

## Installation

Clone this repository into your desired workspace:

    git clone git@github.com:n-whitehead/kd-graph-playground.git

### Downloading ZScaler Cert (Windows users only)

Ideally, we would set up a script to download the cert into the container on creation.

Download the [ZScaler Root Certificate](https://elsevier.atlassian.net/wiki/download/attachments/59535175745/ZscalerRootCerts.zip), open the `ZscalerRootCerts` directory, and move the `ZscalerRootCertificate-2048-SHA256.crt` file to the root directory of this project.

## Run the container

In the root directory of this project, build the Docker service for this project:

    docker compose build

This will build the `jupyter-lab` and `neo4j` containers.

Start the container with

    docker compose up

which will mount the appropriate volumes to the container.
* **Jupyter Lab**: Copy one of the addresses with an attached token from the docker-compose output into your browser to begin navigating the session.
* **Neo4j**: Open `http://localhost:7474` for the Neo4j Desktop.