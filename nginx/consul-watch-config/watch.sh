#!/bin/bash

set -eo pipefail
echo "Starting nginx"
nginx

echo "Starting consul agent"

consul agent -config-dir=/config "$@" &

echo "[sample-app] Starting Consul-Watch"
consul-watch -f /consul-watch/config/nginx-watch.json