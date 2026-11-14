AKS_RESOURCE_GROUP=rdaks-rg
AKS_REGION=northeurope
# Set Cluster Name
AKS_CLUSTER=rd-cluster
# set ACR name
ACR_NAME=rdacrrepo7
echo $AKS_RESOURCE_GROUP, $AKS_REGION, $AKS_CLUSTER, $ACR_NAME
az aks update -n ${AKS_CLUSTER} -g ${AKS_RESOURCE_GROUP} --attach-acr ${ACR_NAME}
# Configure Kube Credentials
az aks get-credentials --name ${AKS_CLUSTER}  --resource-group ${AKS_RESOURCE_GROUP}
# Create a namespace in AKS cluster for Helm deployment
kubectl create namespace helm-deployment