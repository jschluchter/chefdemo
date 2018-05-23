#!/bin/bash
 
AKS_RESOURCE_GROUP=YOUR_AKS_RESOURCE_GROUP
AKS_CLUSTER_NAME=YOUR_AKS_CLUSTER_NAME
ACR_RESOURCE_GROUP=YOUR_ACR_RESOURCE_GROUP
ACR_NAME=YOUR_ACR_NAME
 
# Get the id of the service principal configured for AKS
CLIENT_ID=$(az aks show --resource-group $AKS_RESOURCE_GROUP --name $AKS_CLUSTER_NAME --query "servicePrincipalProfile.clientId" --output tsv)
 
# Get the ACR registry resource id
ACR_ID=$(az acr show --name $ACR_NAME --resource-group $ACR_RESOURCE_GROUP --query "id" --output tsv)
 
# Create role assignment
az role assignment create --assignee $CLIENT_ID --role Reader --scope $ACR_ID