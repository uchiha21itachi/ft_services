echo "Creating docker file......"
eval $(minikube -p minikube docker-env)
docker build -t ft-mysql containers/mysql/.
docker build -t ft-influxdb containers/influxdb/.
docker build -t ft-nginx containers/nginx/.
docker build -t ft-phpmyadmin containers/phpmyadmin/.
docker build -t ft-wordpress containers/wordpress/.
docker build -t ft-ftps containers/ftps/.
docker build -t ft-grafana containers/grafana/.
echo "Creating deployment and service......"
kubectl apply -f yaml/metallb.yaml
kubectl apply -f yaml/influxdb-volume.yaml
kubectl apply -f yaml/mysql-volume.yaml
kubectl apply -f yaml/influxdb.yaml
kubectl apply -f yaml/mysql.yaml
kubectl apply -f yaml/nginx.yaml
kubectl apply -f yaml/phpmyadmin.yaml
kubectl apply -f yaml/wordpress.yaml
kubectl apply -f yaml/ftps.yaml
kubectl apply -f yaml/telegraf-new.yaml
kubectl apply -f yaml/grafana.yaml