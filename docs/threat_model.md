# Modelo de Amenazas (STRIDE) y Plan de Hardening

## 1. Análisis de Amenazas STRIDE
- Spoofing: Mitigado por HTTPS con TLS 1.2/1.3 en Nginx frontal.
- Tampering: Mitigado por cifrado de datos en tránsito (HTTPS).
- Repudiation: Logs persistentes con Prometheus y Loki.
- Information Disclosure: Cifrado AES-256 en DB (pgcrypto) y Secrets en K8s.
- Denial of Service: Límites de recursos por pod y Firewall UFW.
- Elevation of Privilege: Contenedores corriendo bajo usuarios no-root.

## 2. Plan de Hardening VM
UFW configurado cerrando todos los puertos excepto 22 (SSH), 80 (HTTP), 443 (HTTPS) y 5555 (Grafana).
