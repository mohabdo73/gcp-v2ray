# Use the official V2Ray image
FROM v2fly/v2fly-core:latest
# Copy the configuration file
COPY config.json /etc/v2ray/config.json
# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh
# Start the container using the entrypoint script
CMD ["/entrypoint.sh"]
