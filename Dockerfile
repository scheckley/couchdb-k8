FROM couchdb:latest

# Create a non-root user with a specified UID
RUN addgroup -g 1000 couchdb && \
    adduser -G couchdb -u 1000 -D couchdb

# Change permissions on the CouchDB directory
RUN chown -R couchdb:couchdb /opt/couchdb

# default couchdb port
EXPOSE 5984

# Switch to the non-root user
USER couchdb

# Start CouchDB
CMD ["couchdb"]
