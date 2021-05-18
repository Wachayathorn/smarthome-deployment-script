#!/bin/bash

kubectl apply -f ./backend_deployment.yaml
kubectl apply -f ./backend_service.yaml
kubectl apply -f ./backend_ingress.yaml