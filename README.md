# Labs

Laboratorios en contenedores Podman para las materias del ITM (ago-dic 2026).

## Laboratorios

### SQL Server (`sqlserver-lab/`)

SQL Server 2022 Developer Edition para la materia **Taller de Base de Datos**.

| | |
|---|---|
| **Puerto** | `localhost:1433` |
| **Usuario** | `sa` |
| **Contraseña** | `Lab@2026!` |
| **Cliente** | Azure Data Studio |

```bash
cd sqlserver-lab
./start.sh          # Iniciar servidor
./stop.sh           # Detener (datos se mantienen)
podman-compose down -v   # Borrar todo y empezar de cero
```

> Si da error de certificado SSL en Azure Data Studio: en la conexión ir a **Advanced** → **Encrypt** → `False`, o marcar **Trust server certificate**.

---

### Debian (`debian-lab/`)

Debian 12 (Bookworm) para practicar comandos Linux en **Taller de Sistemas Operativos**.

La carpeta `debian-lab/workspace/` se monta en `/root/workspace/` dentro del contenedor (los archivos persisten).

```bash
cd debian-lab
./start.sh          # Iniciar contenedor (instala herramientas la primera vez)
./connect.sh        # Abrir terminal dentro del contenedor
./stop.sh           # Detener (archivos en workspace/ se mantienen)
podman-compose down -v   # Borrar todo y empezar de cero
```

## Requisitos

- [Podman](https://podman.io/)
- [podman-compose](https://github.com/containers/podman-compose)

```bash
sudo pacman -S podman podman-compose
```
