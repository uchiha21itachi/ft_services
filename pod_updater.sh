
echo "Starting to delete the config...."
kubectl delete -f yaml/wordpress.yaml
kubectl delete -f yaml/phpmyadmin.yaml
kubectl delete -f yaml/nginx.yaml
kubectl delete -f yaml/mysql.yaml
sleep 1
echo "updating docker file......"
eval $(minikube -p minikube docker-env)
docker build -t ft-mysql containers/mysql/.
docker build -t ft-mysql containers/nginx/.
docker build -t ft-mysql containers/phpmyadmin/.
docker build -t ft-mysql containers/wordpress/.
echo "Creating deployment and service......"
kubectl apply -f yaml/mysql.yaml
kubectl apply -f yaml/nginx.yaml
kubectl apply -f yaml/phpmyadmin.yaml
kubectl apply -f yaml/wordpress.yaml