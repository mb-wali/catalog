#!/bin/bash

# Add git-clone
add_task git-clone 0.7

# Add service account
kubectl -n ${tns} create serviceaccount helm-pipeline-run-sa

# Add edit role to service account
kubectl -n ${tns} create rolebinding helm-pipeline-run-sa-edit --clusterrole edit --serviceaccount ${tns}:helm-pipeline-run-sa -o yaml --dry-run=client | kubectl apply -f -
