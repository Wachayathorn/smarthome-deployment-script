#!/bin/bash

kubectl apply -f ./mysql_pv.yaml
kubectl apply -f ./mysql_pvc.yaml
kubectl apply -f ./mysql_deployment.yaml
kubectl apply -f ./mysql_service.yaml