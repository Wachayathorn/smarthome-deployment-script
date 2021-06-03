#!/bin/bash

kubectl apply -f ./kubernetes_dashboard_user.yaml
kubectl apply -f ./kubernetes_dashboard_role.yaml
kubectl apply -f ./kubernetes_dashboard._ingressyaml