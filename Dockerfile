#FROM couchdb:latest

FROM default-route-openshift-image-registry.apps.ocp.osprey.hartree.stfc.ac.uk/scp012-dxm01/couchdb

# Check if the group already exists; if not, create it. Do the same for the user.
RUN if ! getent group couchdb; then groupadd -g 1000 couchdb; fi && \
    if ! id -u couchdb >/dev/null 2>&1; then useradd -m -u 1000 -g couchdb couchdb; fi && \
    chown -R couchdb:couchdb /opt/couchdb

# Switch to the non-root user
USER couchdb

# Expose CouchDB's default port
EXPOSE 5984

# Start CouchDB
CMD ["couchdb"]

