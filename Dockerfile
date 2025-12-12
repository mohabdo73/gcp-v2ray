# Use the official V2Ray image
FROM v2fly/v2fly-core:latest
# Copy the configuration file
COPY config.json /etc/v2ray/config.json
# Create the entrypoint script directly inside the image
# This avoids the "file not found" error if entrypoint.sh wasn't uploaded correctly
RUN echo '#!/bin/sh' > /entrypoint.sh && \
    echo 'if [ -z "$PORT" ]; then PORT=8080; fi' >> /entrypoint.sh && \
    echo 'echo "Starting V2Ray on port $PORT..."' >> /entrypoint.sh && \
    echo 'sed -i "s/8080/$PORT/g" /etc/v2ray/config.json' >> /entrypoint.sh && \
    echo 'v2ray run -config /etc/v2ray/config.json' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh
# Start the container
CMD ["/entrypoint.sh"]
