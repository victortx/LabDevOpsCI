# CI Scripts

## Objetivo

Centralizar los comandos usados por GitHub Actions para levantar, validar y apagar el stack Docker Compose.

## Scripts creados

### scripts/ci-up.sh

Crea el archivo `.env` temporal y levanta el stack con Docker Compose.

```bash
./scripts/ci-up.sh
