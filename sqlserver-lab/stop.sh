#!/bin/bash

echo ""
echo "🛑 Deteniendo laboratorio SQL Server..."
podman-compose down
echo "✅ Laboratorio detenido. Los datos se mantienen en el volumen."
echo "Para eliminar los datos: podman-compose down -v"
