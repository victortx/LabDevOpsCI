# CI/CD con GitHub Actions

## Objetivo

Crear un pipeline de integración continua para validar automáticamente el stack Docker Compose.

## Qué valida el pipeline

- Instalación de dependencias con `npm ci`.
- Build de imagen Docker.
- Levantamiento del stack con Docker Compose.
- Estado de contenedores.
- Endpoint `/health`.
- Endpoint `/api/expenses`.

## Servicios validados

- Nginx
- API Node.js
- PostgreSQL

## Comandos principales usados por el pipeline

```bash
npm ci
docker build -t nginx-parcial-proxy:ci .
docker compose up -d --build
docker compose ps
curl -f http://localhost/health
curl -f http://localhost/api/expenses
docker compose down -v
