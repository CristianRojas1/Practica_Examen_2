# Arquitectura de Despliegue - Café Aurora
Nginx Frontal (HTTPS 443) -> Traefik Ingress (NodePort 31029) -> Node APIs (Port 3001-3003) -> PostgreSQL.
El Apache legado corre en el puerto 8080 del host conectándose mediante port-forward a PostgreSQL.
