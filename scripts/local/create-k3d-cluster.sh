#!/usr/bin/env bash

input="$1"
set -eou pipefail

clusterName="playground"
[ "$input" = '' ] && input="$clusterName"

echo "🧬 Attempting to start cluster '$input'..."

# obtain existing cluster
current="$(k3d cluster ls -o json | jq -r --arg input "${input}" '.[] | select(.name == $input) | .name')"
if [ "$current" = "$input" ]; then
  echo "⚠️ Cluster already exist!"
else
  echo "✅ Cluster does not exist, creating..."
  k3d cluster create "$input" --config ./config/k3d.yaml
  echo "🚀 Cluster created!"
fi

echo "🛠 Generating kubeconfig"

mkdir -p "$HOME/.kube/configs"
mkdir -p "$HOME/.kube/k3dconfigs"
k3d kubeconfig get "$clusterName" >"$HOME/.kube/k3dconfigs/k3d-$clusterName"
KUBECONFIG=$(cd ~/.kube/configs && find "$(pwd)"/* | awk 'ORS=":"')$(cd ~/.kube/k3dconfigs && find "$(pwd)"/* | awk 'ORS=":"') kubectl config view --flatten >~/.kube/config
chmod 600 ~/.kube/config
echo "✅ Generated kube config file"
