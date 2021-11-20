appName="picture-fixer$RANDOM-app"
appServicePlanName="picture-fixer$RANDOM-plan"
location="japaneast"
resourceGroup="picture-fixer$RANDOM-rg"

az group create --name $resourceGroup --location $location
az appservice plan create -n $appServicePlanName -g $resourceGroup -l $location --sku S1
az webapp create -n $appName --plan $appServicePlanName -g $resourceGroup  --runtime "dotnet|6.0"
az webapp config appsettings set -g $resourceGroup -n $appName --settings SCM_DO_BUILD_DURING_DEPLOYMENT=true
az webapp up -n $appName -g $resourceGroup -p $appServicePlanName -l $location --os-type Windows --runtime "DOTNET|6.0"