#!/bin/bash
set -e

CONTAINER="sqlserver-lab"

echo "=== Laboratorio SQL Server 2022 ==="
echo ""

# Verificar Podman
if ! command -v podman &> /dev/null; then
    echo "Error: Podman no esta instalado."
    echo "Instala con: sudo pacman -S podman podman-compose"
    exit 1
fi

# Verificar si el contenedor ya existe
if podman ps -a --format '{{.Names}}' | grep -q "^${CONTAINER}$"; then
    # Contenedor existe, verificar si esta corriendo
    if podman ps --format '{{.Names}}' | grep -q "^${CONTAINER}$"; then
        echo "El contenedor ya esta corriendo."
    else
        echo "Iniciando contenedor existente..."
        podman start "$CONTAINER"
    fi
else
    echo "Creando y levantando contenedor..."
    podman-compose up -d
fi

echo ""
echo "Esperando a que SQL Server este listo..."
sleep 5

# Verificar que este listo
for i in {1..30}; do
    if podman exec "$CONTAINER" /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'Lab@2026!' -C -Q "SELECT 1" &>/dev/null; then
        echo ""
        echo "SQL Server listo."
        echo ""
        exit 0
    fi
    echo -n "."
    sleep 2
done

echo ""
echo "Error: SQL Server no respondio a tiempo."
echo "Revisa los logs: podman logs $CONTAINER"
exit 1
