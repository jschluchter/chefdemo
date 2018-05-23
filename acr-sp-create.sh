ACR_RESOURCE_GROUP=YOUR_AZURE_RESOURCE_GROUP
ACR_NAME=YOUR_AZURE_CONTAINER_REGISTRY
BLDR_PRINCIPAL_NAME=YOUR_SP_NAME
BLDR_PRINCIPAL_PASSWORD="YOUR_STRONG_PASSWORD"
 
# Create Service Principal for Habitat Builder
ACR_ID=$(az acr show --name $ACR_NAME --resource-group $ACR_RESOURCE_GROUP --query "id" --output tsv)
az ad sp create-for-rbac --scopes $ACR_ID --role Owner --password "$BLDR_PRINCIPAL_PASSWORD" --name $BLDR_PRINCIPAL_NAME
BLDR_ID=$(az ad sp list --display-name $BLDR_PRINCIPAL_NAME  --query "[].appId" --output tsv)
 
echo "Configuration detals for Habitat Builder Principal:"
echo "  ID : $BLDR_ID"
echo "  Password : $BLDR_PRINCIPAL_PASSWORD"

