# CHANGELOG - Cafe Aurora Infrastructure

## Seccion 1 - Infraestructura Base
**Fecha:** 2026-08-13
**Responsable:** Cristian Thomas Rojas Arce

### Completado:
- Paso 1: VM CafeAurora-VM creada en Hyper-V (Gen2, 4GB RAM, 4vCPU, 45GB VHDX)
- Paso 2: Ubuntu Server 22.04.5 LTS instalado
- Paso 3: Conexion SSH establecida (IP: 172.30.234.75)
- Paso 4: Hardening UFW activo (SSH/80/443), herramientas instaladas
- Paso 5: Docker Engine 29.7.2 instalado
- Paso 6: k3s v1.36.3+k3s1 instalado y nodo Ready
- Paso 7: Repositorio Git inicializado (ramas main y exam)
- Paso 8: PostgreSQL 15 desplegado en k3s (Running)
- Paso 9: Nginx con TLS/SSL configurado
- Paso 10: CHANGELOG creado

## Seccion 2 - Datos
**Fecha:** 2026-08-14
**Responsable:** Cristian Thomas Rojas Arce

### Completado:
- Esquema BD: products, customers, orders, order_items
- Seed: 50 productos, 12 clientes con identidad cifrada (pgp_sym_encrypt)
- Secret K8s: encryption-key (256 bits)
- Cifrado AES verificado: SELECT cifrado vs descifrado
- Scripts backup/restore creados y verificados

## Seccion 3 - Servicios
**Fecha:** 2026-08-14
**Responsable:** Cristian Thomas Rojas Arce

### Completado:
- Catalog API: CRUD productos (puerto 3001)
- Orders API: crear/ver pedidos con cálculo totales (puerto 3002)
- Customers API: CRUD clientes con cifrado/descifrado identidad (puerto 3003)
- Deployments con probes, limits/requests, no-root containers
- Services + Ingress (Traefik) exponiendo /api/catalog, /api/orders, /api/customers
- Healthz endpoints operativos: {"status":"ok"}

## Seccion 4 - Integracion y Seguridad
**Fecha:** 2026-08-14
**Responsable:** Cristian Thomas Rojas Arce

### Completado:
- Apache Legado: Servidor PHP en puerto 8080 con endpoint /legacy/inventory.php conectado a PostgreSQL
- Port-forward de base de datos para acceso seguro desde el host
- Nginx Frontal: Enrutamiento HTTPS hacia /api/* (Kubernetes Ingress) y /legacy/* (Apache)
- Redirección automática de HTTP a HTTPS (301)
- Compresión GZIP habilitada en Nginx
- Hardening: UFW activo y Traefik configurado a NodePort para seguridad
- Threat Model (STRIDE) y Clasificación de Datos documentados

## Seccion 4 - Integracion y Seguridad
**Fecha:** 2026-08-14
**Responsable:** Cristian Thomas Rojas Arce

### Completado:
- Apache Legado: Servidor PHP en puerto 8080 con endpoint /legacy/inventory.php conectado a PostgreSQL
- Port-forward de base de datos para acceso seguro desde el host
- Nginx Frontal: Enrutamiento HTTPS hacia /api/* (Kubernetes Ingress) y /legacy/* (Apache)
- Redirección automática de HTTP a HTTPS (301)
- Compresión GZIP habilitada en Nginx
- Hardening: Firewall UFW activo y Traefik configurado a NodePort para seguridad
- Threat Model (STRIDE) y Clasificación de Datos documentados

## Seccion 5 - Observabilidad
**Fecha:** 2026-08-14
**Responsable:** Cristian Thomas Rojas Arce
- Despliegue de Prometheus, Grafana, Loki y Promtail en namespace "monitoring"
- Grafana configurado en puerto 5555
- Pruebas de carga realizadas con Apache Benchmark

## Seccion 6 - Documentacion
**Fecha:** 2026-08-14
**Responsable:** Cristian Thomas Rojas Arce
- Documentos tecnicos consolidados en docs/

## Seccion 5 - Observabilidad
**Fecha:** 2026-08-14
**Responsable:** Cristian Thomas Rojas Arce
- Despliegue de Prometheus, Grafana, Loki y Promtail en namespace "monitoring"
- Grafana configurado en puerto 5555
- Pruebas de carga realizadas con Apache Benchmark

## Seccion 6 - Documentacion
**Fecha:** 2026-08-14
**Responsable:** Cristian Thomas Rojas Arce
- Documentos tecnicos consolidados en docs/
