#!/bin/bash

set -eo pipefail
echo "Starting consul agent"

#/bin/consul agent -config-dir=/config $@