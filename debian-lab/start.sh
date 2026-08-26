#!/bin/bash
set -e

CONTAINER="debian-lab"

echo "=== Laboratorio Debian (TSO) ==="
echo ""

if ! command -v podman &> /dev/null; then
    echo "Error: Podman no esta instalado."
    echo "Instala con: sudo pacman -S podman podman-compose"
    exit 1
fi

if podman ps -a --format '{{.Names}}' | grep -q "^${CONTAINER}$"; then
    if podman ps --format '{{.Names}}' | grep -q "^${CONTAINER}$"; then
        echo "El contenedor ya esta corriendo."
    else
        echo "Iniciando contenedor existente..."
        podman start "$CONTAINER"
    fi
else
    echo "Creando y levantando contenedor..."
    podman-compose up -d
    echo ""
    echo "Instalando herramientas y configuracion..."
    podman exec "$CONTAINER" bash -c "apt-get update && apt-get install -y vim nano gcc make git curl wget > /dev/null 2>&1"
    podman exec "$CONTAINER" bash -c "curl -sS https://starship.rs/install.sh | sh -s -- -y > /dev/null 2>&1"
    podman exec "$CONTAINER" bash -c "wget -q https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb -O /tmp/fastfetch.deb && dpkg -i /tmp/fastfetch.deb > /dev/null 2>&1"
    podman exec "$CONTAINER" mkdir -p /root/.config/fastfetch
    podman cp ./workspace/.config/starship.toml "$CONTAINER":/root/.config/starship.toml
    podman cp ./workspace/.config/config.jsonc "$CONTAINER":/root/.config/fastfetch/config.jsonc
    podman exec "$CONTAINER" bash -c 'grep -q starship /root/.bashrc || echo "eval \"\$(starship init bash)\"" >> /root/.bashrc'
    podman exec "$CONTAINER" bash -c 'grep -q fastfetch /root/.bashrc || echo "fastfetch" >> /root/.bashrc'
fi

echo ""
echo "Debian listo."
echo ""
