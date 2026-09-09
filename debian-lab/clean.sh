#!/bin/bash

CONTAINER="debian-lab"

echo ""
echo "Limpiando laboratorio Debian..."
echo "Esto destruira el contenedor y todo lo instalado."
read -p "Continuar? (s/n) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Ss]$ ]]; then
    podman-compose down -v 2>/dev/null
    echo "Laboratorio limpio. Listo para empezar de cero."
    echo "Ejecuta './start.sh' para crear un contenedor nuevo."
else
    echo "Cancelado."
fi
