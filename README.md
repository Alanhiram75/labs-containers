# Labs

Entornos de laboratorio listos para usar con Podman. Contenedores preconfigurados para practicar bases de datos, Linux y más.

## Laboratorios disponibles

### Debian (`debian-lab/`)

Debian 12 (Bookworm) para practicar comandos y administración de Linux.

![Debian](/Debian.png)

La carpeta `debian-lab/workspace/` se monta en `/root/workspace/` dentro del contenedor. Los archivos persisten entre sesiones.

```bash
cd debian-lab
./start.sh              # Iniciar contenedor (instala herramientas la primera vez)
./connect.sh            # Abrir terminal dentro del contenedor
./stop.sh               # Detener
podman-compose down -v  # Eliminar completamente
```

---

### SQL Server (`sqlserver-lab/`)

SQL Server 2022 Developer Edition, ideal para aprender bases de datos relacionales.

| | |
|---|---| 
| **Puerto** | `localhost:1433` |
| **Usuario** | `sa` |
| **Contraseña** | `Lab@2026!` |
| **Cliente recomendado** | DBeaver (configurado), o `sqlcmd` |

```bash
cd sqlserver-lab
./start.sh              # Iniciar servidor
./stop.sh               # Detener (datos persistentes)
podman-compose down -v  # Eliminar completamente
```

> Si aparece error de certificado SSL: en la conexión ir a **Advanced** → **Encrypt** → `False`, o marcar **Trust server certificate**.

---

## Requisitos

- [Podman](https://podman.io/)
- [podman-compose](https://github.com/containers/podman-compose)

```bash
sudo pacman -S podman podman-compose
```

## ¿Cómo funciona?

Cada laboratorio es un directorio independiente con:

- `docker-compose.yml` — configuración del contenedor
- `start.sh` — crea e inicia el contenedor
- `stop.sh` — detiene sin perder datos
- `connect.sh` — abre una sesión interactiva (cuando aplica)

Los datos se almacenan en volúmenes persistentes. Solo `podman-compose down -v` elimina todo.

![Arquitectura de contenedores](/arquitectura%20de%20contenedores.png)

## Contribuir

¿Tienes un laboratorio que quieras agregar? Los pasos son:

1. Crea una carpeta con el nombre del laboratorio
2. Agrega tu `docker-compose.yml` y scripts de inicio
3. Actualiza este README con la documentación
4. Envía un pull request

## Licencia

MIT
