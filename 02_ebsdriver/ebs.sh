#!/bin/bash

# Deploy EBS CSI Driver
sudo kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=master"

# Verify ebs-csi pods running
sudo kubectl get pods -n kube-system