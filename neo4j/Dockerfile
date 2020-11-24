ARG NEO4J_VERSION=4.1.1
FROM neo4j:${NEO4J_VERSION}

ENV NEO4J_AUTH=none
#ENV NEO4J_ACCEPT_LICENSE_AGREEMENT yes

# Copy dump files to be extracted
COPY graphs /tmp/graphs

# Copy new entrypoint script to the container, set permissions.
COPY scripts/playground-entrypoint.sh /playground-entrypoint.sh
RUN chmod +x /playground-entrypoint.sh

# Overwrite docker entrypoint
ENTRYPOINT ["/sbin/tini", "-g", "--", "/playground-entrypoint.sh"]

# Run neo4j
CMD ["neo4j"]
