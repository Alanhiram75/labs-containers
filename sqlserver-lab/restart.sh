#!/bin/bash
set -e

CONTAINER="sqlserver-lab"

echo ""
echo "Reiniciando laboratorio SQL Server..."

podman-compose down 2>/dev/null || true
podman-compose up -d -t 0

echo ""
sleep 5

for i in {1..30}; do
    if podman exec "$CONTAINER" /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'Lab@2026!' -C -Q "SELECT 1" &>/dev/null; then
        echo ""
        echo "Servidor SQL activo."
        exit 0
    fi
    echo -n "."
    sleep 2
done

echo ""
echo "Error: SQL Server no respondio a tiempo."
echo "Revisa los logs: podman logs $CONTAINER"
exit 1
