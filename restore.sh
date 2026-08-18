#!/bin/bash
POD=$(kubectl get pod -l app=postgres -o jsonpath='{.items[0].metadata.name}')
LATEST=$(ls -t ~/cafeaurora/backup_*.sql | head -1)
kubectl exec -i $POD -- psql -U cafeboreal_admin -d cafeboreal_db < $LATEST
echo "Restore completado desde $LATEST"
