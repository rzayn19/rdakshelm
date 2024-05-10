#!/bin/sh
# This is the shell script for creating AKS cluster, ACR Repo and a namespace
#Create Resource Group
AKS_RESOURCE_GROUP=rdaks-rg
AKS_REGION=northeurope
# Set Cluster Name
AKS_CLUSTER=rd-cluster
# set ACR name
ACR_NAME=rdacrrepo7
echo $AKS_RESOURCE_GROUP, $AKS_REGION, $AKS_CLUSTER, $ACR_NAME
# Create Resource Group
az group create --location ${AKS_REGION} --name ${AKS_RESOURCE_GROUP}
# Create AKS cluster with two worker nodes
az aks create --resource-group ${AKS_RESOURCE_GROUP} --name ${AKS_CLUSTER} --node-count 2 --generate-ssh-keys
# Create Azure Container Registry
az acr create --resource-group ${AKS_RESOURCE_GROUP} \
--name ${ACR_NAME} \
--sku Standard \
--location ${AKS_REGION}