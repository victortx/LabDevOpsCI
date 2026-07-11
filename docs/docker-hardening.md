# Docker Hardening y Optimización

## Mejoras aplicadas

- Dockerfile multi-stage.
- Uso de npm ci en lugar de npm install.
- Instalación solo de dependencias productivas con --omit=dev.
- Ejecución de la app con usuario no root.
- HEALTHCHECK para validar /health.
- .dockerignore mejorado.
- Límites básicos de CPU y memoria en Docker Compose.

## Comandos usados

```bash
sudo docker compose down
sudo docker compose up -d --build
sudo docker compose ps
sudo docker ps
curl http://localhost/health
curl http://localhost/api/expenses
sudo docker exec -it nginx-parcial-proxy whoami
sudo ss -tulpn | grep -E ':80|:3000|:5432'
sudo docker images
