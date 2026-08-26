#!/bin/bash

CONTAINER="sqlserver-lab"

if ! podman ps --format '{{.Names}}' | grep -q "^${CONTAINER}$"; then
    echo "El contenedor no esta corriendo. Ejecuta: ./start.sh"
    exit 1
fi

echo "=== Conectando a SQL Server ==="
echo "Escribe 'GO' despues de tu query para ejecutarla."
echo "Para salir: EXIT"
echo ""

podman exec -it "$CONTAINER" /opt/mssql-tools18/bin/sqlcmd \
    -S localhost \
    -U sa \
    -P 'Lab@2026!' \
    -C
