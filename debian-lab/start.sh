#!/bin/bash
set -e

CONTAINER="debian-lab"

if ! command -v podman &> /dev/null; then
    echo "🛑 Error: Podman no esta instalado."
    echo "Instala con: sudo pacman -S podman podman-compose"
    exit 1
fi

echo ""
echo "🚀 Iniciando laboratorio Debian..."

if podman ps -a --format '{{.Names}}' | grep -q "^${CONTAINER}$"; then
    if podman ps --format '{{.Names}}' | grep -q "^${CONTAINER}$"; then
        echo "✅ Contenedor ya en ejecucion."
    else
        podman start "$CONTAINER"
        sleep 2
        echo "✅ Contenedor iniciado."
    fi
else
    podman-compose up -d -t 0
fi

echo ""
echo ""
echo "✅ Laboratorio Debian activo."
echo "Si aun no estas dentro, usa './connect.sh'."
echo "Dentro del contenedor: 'exit' para salir."
echo ""
echo ""