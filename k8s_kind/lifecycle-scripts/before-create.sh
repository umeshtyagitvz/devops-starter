#!/bin/sh
set -o errexit

# create registry container unless it already exists
if [ "$(docker inspect -f '{{.State.Running}}' "kind-registry" 2>/dev/null || true)" != 'true' ]; then
  docker run \
    -d --restart=always -p "127.0.0.1:5001:5000" --name "kind-registry" \
    registry:2
fi