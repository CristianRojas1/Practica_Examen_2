# Definición de SLAs, SLOs y Comparativa de Arquitectura

## 1. Métrica de SLA y SLO
- Disponibilidad: >= 99.5% al mes.
- Latencia (p95): < 300 ms (Carga baja: 172ms, Carga alta: 518ms).
- Tasa de Errores: < 1% de errores HTTP.

## 2. Conclusión Técnico-Económica
Recomendado usar PaaS (AWS ECS / Azure AKS) para evitar costos operativos iniciales y automatizar backups y escalabilidad.
