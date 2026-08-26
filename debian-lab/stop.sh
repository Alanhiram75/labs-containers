#!/bin/bash

echo "=== Deteniendo Debian ==="
podman-compose down
echo "Contenedor detenido. Los archivos en workspace/ se mantienen."
