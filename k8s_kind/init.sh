K8S_VERSION="1.22.9"
# Create kind k8s cluster
./lifecycle-scripts/before-create.sh

kind create cluster --image="kindest/node:v${K8S_VERSION}" --config=./kind-cluster-config.yaml
kubectl wait --for=condition=Ready nodes --all --timeout=120s

./lifecycle-scripts/after-create.sh
