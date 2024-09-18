#!/bin/bash

sudo kubectl create namespace prometheus

sudo helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
	
sudo helm install prometheus prometheus-community/prometheus --namespace prometheus --set alertmanager.persistentVolume.storageClass="gp2" --set server.persistentVolume.storageClass="gp2"

sudo kubectl apply -f pv.yaml

echo "finishing installation..."
sleep 60

sudo kubectl get pods -n prometheus
