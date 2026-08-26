#!/bin/bash

CONTAINER="debian-lab"

if ! podman ps --format '{{.Names}}' | grep -q "^${CONTAINER}$"; then
    echo "El contenedor no esta corriendo. Ejecuta: ./start.sh"
    exit 1
fi

podman exec -it "$CONTAINER" bash --login
