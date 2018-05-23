ACR_RESOURCE_GROUP=rg-chefconf
ACR_NAME=chefconf
BLDR_PRINCIPAL_NAME=chefconfdemo
BLDR_PRINCIPAL_PASSWORD="areallystrongpasswordhere"
 
# Create Service Principal for Habitat Builder
ACR_ID=$(az acr show --name $ACR_NAME --resource-group $ACR_RESOURCE_GROUP --query "id" --output tsv)
az ad sp create-for-rbac --scopes $ACR_ID --role Owner --password "$BLDR_PRINCIPAL_PASSWORD" --name $BLDR_PRINCIPAL_NAME
BLDR_ID=$(az ad sp list --display-name $BLDR_PRINCIPAL_NAME  --query "[].appId" --output tsv)
 
echo "Configuration detals for Habitat Builder Principal:"
echo "  ID : $BLDR_ID"
echo "  Password : $BLDR_PRINCIPAL_PASSWORD"

