```bash
dotnet workload install wasm-tools

cd PictureFixer/Server
dotnet publish -c Release

cd bin/Release/net6.0/publish

# publish したものをZIP化してリリースするので、ビルドは抑制
az webapp config appsettings set -g picture-fixer20191-rg -n picture-fixer22319-app --settings SCM_DO_BUILD_DURING_DEPLOYMENT=false
az webapp up -n picture-fixer-aot2297-app -g picture-fixer-aot26300-rg -p picture-fixer-aot21418-plan -l japaneast --os-type Windows --runtime "DOTNET|6.0"

```