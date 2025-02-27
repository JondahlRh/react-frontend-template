# repo-name

repo-description

## Dependencies and Development

Project uses [pnpm](https://pnpm.io/) for dependency management.

In development the app will be started with vite.

It's recomended to test the app with [docker](https://docs.docker.com/get-docker/) bevor commiting changes. (Example docker compose setup below)

```bash
pnpm install
pnpm dev
```

## Environment Variables

```bash

```

## Example docker-compose setup

```bash
# windows
docker-compose -f .\docker-compose.local.yml -p repo-name up --build

# linux
docker-compose -f ./docker-compose.local.yml -p repo-name up --build
```

```yaml filename="docker-compose.local.yml"
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
      args:
        - name=value
    image: repo-name:latest
    container_name: repo-name
    restart: unless-stopped
    ports:
      - "3000:80"
```
