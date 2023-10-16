#!/bin/bash
set -e

if [ -z "$REGISTRY_URL" ]; then
  echo "Repository url is required but not defined."
  exit 1
fi

if [ "$REGISTRY_USERNAME" ]; then
  echo "Username is defined, using as parameter."
  REGISTRY_USERNAME="--username ${REGISTRY_USERNAME}"
fi

if [ "$REGISTRY_PASSWORD" ]; then
  echo "Password is defined, using as parameter."
  REGISTRY_PASSWORD="--password ${REGISTRY_PASSWORD}"
fi

if [ "$CONTEXT_PATH" ]; then
  echo "Helm use context path."
  CONTEXT_PATH="--context-path=$CONTEXT_PATH"
fi

helm repo add formind ${REGISTRY_URL} ${REGISTRY_USERNAME} ${REGISTRY_PASSWORD}
helm repo update
cd ./helm
helm lint .
helm dependency build
helm cm-push . ${REGISTRY_URL} ${REGISTRY_USERNAME} ${REGISTRY_PASSWORD} ${CONTEXT_PATH}
