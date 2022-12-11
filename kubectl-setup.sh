#!/usr/bin/env bash

if [ "$KUBECTL_VERSION" = "latest" ]; then
  KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
fi
curl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$KUBECTL_VERSION/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256) kubectl" | sha256sum --check

mkdir $GITHUB_WORKSPACE/bin
mv kubectl $GITHUB_WORKSPACE/bin && chmod +x $GITHUB_WORKSPACE/bin/kubectl 
echo "$GITHUB_WORKSPACE/bin" >> $GITHUB_PATH