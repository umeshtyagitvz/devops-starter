#!/bin/sh
set -o errexit

# connect the registry to the cluster network if not already connected
if [ "$(docker inspect -f='{{json .NetworkSettings.Networks.kind}}' "kind-registry")" = 'null' ]; then
  docker network connect "kind" "kind-registry"
fi


# ingress-nginx
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
echo "Waiting for ingress to be up"
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s

kubectl apply -f kind-cluster-resources-after-running.yaml