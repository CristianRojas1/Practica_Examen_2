#!/bin/bash
POD=$(kubectl get pod -l app=postgres -o jsonpath='{.items[0].metadata.name}')
kubectl exec $POD -- pg_dump -U cafeboreal_admin cafeboreal_db > ~/cafeaurora/backup_$(date +%Y%m%d_%H%M%S).sql
echo "Backup completado"
