#!/bin/bash

#MYSQL_DEPLOYMENT
kubectl apply -f ./mysql/mysql_pv.yaml
kubectl apply -f ./mysql/mysql_pvc.yaml
kubectl apply -f ./mysql/mysql_deployment.yaml
kubectl apply -f ./mysql/mysql_service.yaml

#REDIS_DEPLOYMENT
kubectl apply -f ./redis/redis_pv.yaml
kubectl apply -f ./redis/redis_pvc.yaml
kubectl apply -f ./redis/redis_deployment.yaml
kubectl apply -f ./redis/redis_service.yaml

#BACKEND_DEPLOYMENT
kubectl apply -f ./backend/backend_configmap.yaml
kubectl apply -f ./backend/backend_deployment.yaml
kubectl apply -f ./backend/backend_service.yaml
kubectl apply -f ./backend/backend_ingress.yaml