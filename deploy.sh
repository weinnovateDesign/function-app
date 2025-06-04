#!/bin/bash

# Get version number as parameter or use timestamp
if [ -z "$1" ]; then
    VERSION=$(date +%Y%m%d-%H%M%S)
else
    VERSION=$1
fi

echo "Deploying version: $VERSION"

# Build the Docker image
echo "Building Docker image..."
docker build -t weinnovatedesign/myfunctionapp:$VERSION .

# Push to Docker Hub
echo "Pushing to Docker Hub..."
docker push weinnovatedesign/myfunctionapp:$VERSION

# Update Azure Function App
echo "Updating Azure Function App..."
az functionapp config container set \
  --name walai-document-analysis \
  --resource-group WAL-AI \
  --image "weinnovatedesign/myfunctionapp:$VERSION"

echo "Deployment complete! Version: $VERSION"
