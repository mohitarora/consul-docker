#!/bin/bash

set -eo pipefail

echo "[sample-app] Starting Application"
java -jar /application/dropwizard-sample-1.0-SNAPSHOT.jar server /application/sample.yml &

echo "Starting consul agent"

consul agent -config-dir=/config -join=172.17.0.2