#!/bin/bash
set -e

CONTAINER="debian-lab"

echo ""
echo "Reiniciando laboratorio Debian..."

podman stop "$CONTAINER" 2>/dev/null || true
sleep 1
podman start "$CONTAINER"
sleep 2

echo "Laboratorio reiniciado. Todo se mantiene."
echo "Usa './connect.sh' para entrar."
