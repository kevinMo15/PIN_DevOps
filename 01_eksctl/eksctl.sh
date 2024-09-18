#!/bin/bash

#Create kubernetes cluster
sudo eksctl create cluster \
  --name mundoes-cluster-G6 \
  --region us-east-1 \
  --nodes 3 \
  --node-type t2.small \
  --with-oidc \
  --ssh-access \
  --ssh-public-key pin \
  --managed \
  --full-ecr-access

#Create Nginx deployment  
sudo kubectl apply -f deploy.yaml

#Create Nginx service  
sudo kubectl apply -f service.yaml

echo "Finishing the installation..."
sleep 60

#Obtain the url for Nginx
nginx_ip="$(sudo kubectl get services nginx-service | awk 'NR==2{print $4}')"
echo "---------------------------------------------------------------------------------"
echo "You can view the page in your browser with this URL: $nginx_ip"
echo "---------------------------------------------------------------------------------"



