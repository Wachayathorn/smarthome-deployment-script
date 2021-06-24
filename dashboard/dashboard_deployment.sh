#!/bin/bash

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.1/aio/deploy/recommended.yaml
kubectl apply -f ./kubernetes_dashboard_user.yaml
kubectl apply -f ./kubernetes_dashboard_role.yaml
kubectl apply -f ./kubernetes_dashboard_ingress.yaml