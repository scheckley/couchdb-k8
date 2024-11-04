FROM couchdb:latest  # Use the official CouchDB image as a base

# Create a non-root user with a specified UID
RUN addgroup -g 1000 couchdb && \
    adduser -G couchdb -u 1000 -D couchdb

# Change permissions on the CouchDB directory
RUN chown -R couchdb:couchdb /opt/couchdb

# Switch to the non-root user
USER couchdb

# Start CouchDB
CMD ["couchdb"]