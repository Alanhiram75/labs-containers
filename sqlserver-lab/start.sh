#!/bin/bash
set -e

CONTAINER="sqlserver-lab"

if ! command -v podman &> /dev/null; then
    echo "🛑 Error: Podman no esta instalado."
    echo "Instala con: sudo pacman -S podman podman-compose"
    exit 1
fi

echo ""
echo "🚀 Iniciando laboratorio SQL Server..."

if podman ps -a --format '{{.Names}}' | grep -q "^${CONTAINER}$"; then
    if podman ps --format '{{.Names}}' | grep -q "^${CONTAINER}$"; then
        echo "✅ Contenedor ya en ejecucion."
    else
        podman start "$CONTAINER"
        sleep 3
        echo "✅ Contenedor iniciado."
    fi
else
    podman-compose up -d -t 0
fi

echo ""
sleep 5

for i in {1..30}; do
    if podman exec "$CONTAINER" /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'Lab@2026!' -C -Q "SELECT 1" &>/dev/null; then
        echo ""
        echo "✅ Servidor SQL activo."
        exit 0
    fi
    echo -n "."
    sleep 2
done

echo ""
echo "🛑 Error: SQL Server no respondio a tiempo."
echo "Revisa los logs: podman logs $CONTAINER"
exit 1
