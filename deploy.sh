set -e

NAME="kubernetes-demo-api"
USERNAME="thesavioureking"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker Image..."
docker build -t $IMAGE .

echo "Pushing image to Docker hub..."
docker push $IMAGE

echo "Applying Kubernetes manifests ..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting pods..."
kubectl get pods

echo "Getting services..."
kubectl get services

echo "Fetching the main service"
kubectl get services $NAME-service