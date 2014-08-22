#!/bin/bash

set -eo pipefail
echo "Starting nginx"
nginx

echo "Starting consul agent"

consul agent -config-dir=/config "$@" &

# Being optimistic that consul will start in 30s
sleep 30

echo "[sample-app] Starting Consul-Watch"
consul-watch -f /consul-watch/config/nginx-watch.json