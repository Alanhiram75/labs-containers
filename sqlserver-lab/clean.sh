#!/bin/bash

CONTAINER="sqlserver-lab"

echo ""
echo "Limpiando laboratorio SQL Server..."
echo "Esto destruira el contenedor y TODOS los datos de la base."
read -p "Continuar? (s/n) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Ss]$ ]]; then
    podman-compose down -v 2>/dev/null
    echo "Laboratorio limpio. Listo para empezar de cero."
    echo "Ejecuta './start.sh' para crear un contenedor nuevo."
else
    echo "Cancelado."
fi
