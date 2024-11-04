#FROM couchdb:latest

FROM default-route-openshift-image-registry.apps.ocp.osprey.hartree.stfc.ac.uk/scp012-dxm01/couchdb

# Create a group and user with specific UID and GID, ensuring they own the CouchDB files
RUN groupadd -g 1000 couchdb && \
    useradd -m -u 1000 -g couchdb couchdb && \
    chown -R couchdb:couchdb /opt/couchdb

# Switch to the non-root user
USER couchdb

# Expose CouchDB's default port
EXPOSE 5984

# Start CouchDB
CMD ["couchdb"]
