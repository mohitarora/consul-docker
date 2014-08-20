#!/bin/bash

set -eo pipefail
echo "Starting consul agent"

consul agent -config-dir=/config "$@"