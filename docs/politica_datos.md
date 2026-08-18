# Política de Clasificación de Datos y Matriz de Controles

Este documento define la política de seguridad y manejo de información para **Café Aurora S.R.L.**

## 1. Niveles de Clasificación de Datos
- **Público:** Nombres de productos, descripciones, precios base, imágenes.
- **Interno:** Niveles de stock de inventario, historial de compras global.
- **Confidencial:** Cédulas/identificaciones de clientes, correos electrónicos, contraseñas.

## 2. Matriz de Controles de Seguridad
Cifrado AES-256 obligatorio para datos confidenciales en reposo, HTTPS TLS 1.2+ obligatorio en tránsito, y control de acceso restricto en Kubernetes.
