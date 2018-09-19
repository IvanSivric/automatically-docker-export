#!/bin/bash

set -e
set -u

CONTAINER_NAMES=$(docker ps --format "{{.Names}}")
for container_name in $CONTAINER_NAMES; do
    ARCHIVE_NAME="$container_name-$(date +"%m%d%y_%H%M%S").tar"
    echo "Exporting $container_name to archive $ARCHIVE_NAME ."
    docker export $container_name > $ARCHIVE_NAME
done

