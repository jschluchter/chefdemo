# Production-ready Kubernetes (on AKS) and Habitat
in *40 minutes*

## Steps

### Application(s)
1. Have an app
2. Install [Habitat](https://www.habitat.sh/docs/install-habitat/)
3. Push to github
4. Create [Origin on Habitat.sh](https://bldr.habitat.sh/#/origin)

### Azure Container Registry (ACR)
1. Create an [Azure Container Registry](https://portal.azure.com/#create/Microsoft.ContainerRegistry) 
2. Create [service principal for ACR](acr-sp-create.sh)
3. Add ACR integration in Habitat Origins => Integrations


### Azure Kubernetes Service (AKS)
