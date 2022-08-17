docker build --tag python-docker-helm:1.0.0 .
kind create cluster --config kind-example-config-linux.yaml 
kind load docker-image python-docker-helm:1.0.0

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=120s

helm install helm-example ../helm-example

sleep 15

kubectl get pods

kubectl get ingress

curl http://localhost/helm