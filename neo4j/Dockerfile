ARG NEO4J_VERSION=4.1.1
FROM neo4j:${NEO4J_VERSION}

ENV NEO4J_PASSWD test
ENV NEO4J_AUTH=neo4j/${NEO4J_PASSWD}

COPY wrapper.sh wrapper.sh

ENTRYPOINT ["./wrapper.sh"]