# Debian lab

Un laboratorio Debian en un contenedor Podman con [Fastfetch](https://github.com/fastfetch-cli/fastfetch) y [Starship](https://starship.rs/) configurados para Bash.

## Requisitos

- Podman
- podman-compose

En Arch Linux se pueden instalar con:

```sh
sudo pacman -S podman podman-compose
```

## Uso

Desde este directorio:

```sh
./start.sh
./connect.sh
```

`start.sh` construye la imagen definida en `Dockerfile` la primera vez y levanta el contenedor. `connect.sh` abre una shell Bash dentro de Debian. Los archivos que pongas en `workspace/` quedan disponibles tanto en el host como en `/root/workspace` dentro del contenedor.

Para detener o eliminar el laboratorio:

```sh
podman-compose stop
./clean.sh
```

`clean.sh` pide confirmación y elimina el contenedor y el volumen persistente. Los cambios guardados dentro de `/root` se pierden al limpiar; guarda los archivos que quieras conservar en `workspace/`.

## Configuración visual

- `workspace/.config/config.jsonc`: configuración de Fastfetch.
- `workspace/.config/starship.toml`: configuración del prompt Starship.

Compose monta ambas configuraciones en las rutas que esperan las aplicaciones. Starship y Fastfetch se inician al abrir una shell Bash de login.
