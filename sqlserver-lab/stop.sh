#!/bin/bash

echo "=== Deteniendo SQL Server ==="
podman-compose down
echo "Contenedor detenido. Los datos se mantienen en el volumen."
echo "Para eliminar los datos: podman-compose down -v"
