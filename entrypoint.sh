#!/bin/sh
# Set default PORT if not set (for local testing)
if [ -z "$PORT" ]; then
  PORT=8080
fi
echo "Starting V2Ray on port $PORT..."
# Replace the placeholder port 8080 in config.json with the dynamic PORT variable
# This is crucial for Railway as they assign a random port each deployment
sed -i "s/8080/$PORT/g" /etc/v2ray/config.json
# Run V2Ray
v2ray run -config /etc/v2ray/config.json
