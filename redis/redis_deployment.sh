#!/bin/bash

kubectl apply -f ./redis_pv.yaml
kubectl apply -f ./redis_pvc.yaml
kubectl apply -f ./redis_deployment.yaml
kubectl apply -f ./redis_service.yaml