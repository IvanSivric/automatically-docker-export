#!/bin/bash

set -e
set -u

CONTAINER_NAMES=$(docker ps --format "{{.Names}}")
for container_name in $CONTAINER_NAMES; do
    docker export container_name > "$container_name_$(date +"%m%d%y_%H%M%S").tar"
done
