#!/bin/bash

CONTAINER="sqlserver-lab"

echo ""
echo "Deteniendo laboratorio SQL Server..."
podman stop "$CONTAINER" 2>/dev/null
echo "Contenedor detenido. Todos los datos se mantienen."
