ARG NEO4J_VERSION=4.2.1
FROM neo4j:${NEO4J_VERSION}-enterprise

##############################################################
# MANDATORY FOR ZSCALER - Include Zscaler cert in /jupyter directory
# Found here: https://elsevier.atlassian.net/wiki/download/attachments/59535175745/ZscalerRootCerts.zip
##############################################################
# Zscaler Root Intermediate CA Cert - THIS WILL BE REQUIRED FOR BUILDING & RUNNING ON RELX WINDOWS HOSTS!
ARG ZSCALER_CA_CERT="ZscalerRootCertificate-2048-SHA256.crt"
# Zscaler Cert CopyTo Path Inside Container
ARG ZSCALER_CA_PATH="/usr/local/share/ca-certificates"
# Local CA Certs TrustStore Location inside Container runtime - Zscaler Cert will be imported here, so we need to for its use!
ARG REQUESTS_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"
# Install ca-certificates package so we can import Zscaler certificate into Container at runtime...
RUN apt update && apt-get install ca-certificates
# Copy Zscaler Cert into the directory in our Container
COPY ${ZSCALER_CA_CERT} ${ZSCALER_CA_PATH}/${ZSCALER_CA_CERT}
# Run update-ca-certificates utility to import the Zscaler certificate into Container TrustStore at runtime...
RUN ls -latr ${ZSCALER_CA_PATH}/ && ls -latr ${REQUESTS_CA_BUNDLE} && update-ca-certificates \
# Set REQUESTS_CA_BUNDLE env variable so that when we install python and py-pip it will use our custom certs bundle instead of its own...
&& export REQUESTS_CA_BUNDLE=${REQUESTS_CA_BUNDLE}
##############################################################

# Copy dump files to be extracted
COPY /neo4j/graphs /tmp/graphs

# Copy new entrypoint script to the container, set permissions.
COPY /neo4j/scripts/playground-entrypoint.sh /playground-entrypoint.sh
RUN chmod +x /playground-entrypoint.sh

# Overwrite docker entrypoint
ENTRYPOINT ["/sbin/tini", "-g", "--", "/playground-entrypoint.sh"]

# Run neo4j
CMD ["neo4j"]
