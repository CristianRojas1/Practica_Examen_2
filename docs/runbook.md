# RunBook de Operaciones - Café Aurora

## 1. Procedimiento de Arranque
Iniciar VM y verificar Nginx, Apache y Kubernetes.

## 2. Endpoints de Salud
- API Catálogo: `https://172.30.234.75/api/catalog/healthz`
- API Pedidos: `https://172.30.234.75/api/orders/healthz`
- API Clientes: `https://172.30.234.75/api/customers/healthz`
- Módulo Legado: `https://172.30.234.75/legacy/inventory.php`

## 3. Respaldos y Restauración
- Generar Backup: `~/cafeaurora/backup.sh`
- Restaurar Backup: `~/cafeaurora/restore.sh`
