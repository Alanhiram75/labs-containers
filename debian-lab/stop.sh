#!/bin/bash

CONTAINER="debian-lab"

echo ""
echo "Deteniendo laboratorio Debian..."
podman stop "$CONTAINER" 2>/dev/null
echo "Contenedor detenido. Todo lo instalado se mantiene."
