#!/bin/bash

set -eo pipefail

echo "[sample-app] Starting Application"
java -jar /application/dropwizard-sample-1.0-SNAPSHOT.jar server /application/sample.yml &

/bin/launch.sh "$@"