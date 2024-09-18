#!/bin/bash
# Generate a random admin password
ADMIN_PASSWORD=$(openssl rand -base64 12)
# Add the Grafana Helm chart repository
sudo helm repo add grafana https://grafana.github.io/helm-charts

# Update your local Helm chart repository cache
sudo helm repo update

# Create the 'monitoring' namespace if it does not exist
sudo kubectl create namespace grafana 

# Install Grafana with a release name 'grafana' into the 'monitoring' namespace
sudo helm install grafana grafana/grafana \
  --namespace grafana \
  --values grafana.yaml \
  --set persistence.enabled=true \
  --set persistence.storageClassName=gp2 \
  --set adminPassword="$ADMIN_PASSWORD" \
  --set service.type=LoadBalancer


echo "finishing the installation..."
sudo sleep 60
sudo kubectl get all -n grafana


#Obtain the url for the grafana page
grafana_ip="$(sudo kubectl get all -n grafana | awk 'NR==5{print $4}')"
echo "---------------------------------------------------------------------------------"
echo "You can view the page in your browser with this URL: $grafana_ip"
echo "Grafana admin password: $ADMIN_PASSWORD"
echo "---------------------------------------------------------------------------------"