#!/bin/bash

echo ""
echo "🛑 Deteniendo laboratorio Debian..."
podman-compose down
echo "✅ Laboratorio detenido. Los archivos en workspace/ se mantienen."
