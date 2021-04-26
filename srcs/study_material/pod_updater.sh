eval $(minikube -p minikube docker-env)

echo "Starting to delete the config...."
kubectl delete -f yaml/telegraf.yaml
kubectl delete -f yaml/ftps.yaml
kubectl delete -f yaml/wordpress.yaml
kubectl delete -f yaml/phpmyadmin.yaml
kubectl delete -f yaml/nginx.yaml
kubectl delete -f yaml/grafana.yaml
kubectl delete -f yaml/influxdb.yaml
kubectl delete -f yaml/mysql.yaml
kubectl delete -f yaml/metallb.yaml
# kubectl delete -f yaml/influxdb-volume.yaml
# kubectl delete -f yaml/mysql-volume.yaml

sleep 1
echo "updating docker file......"
eval $(minikube -p minikube docker-env)



docker build -t ft-mysql containers/mysql/. 
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------Mysql docker image done--------------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 1
docker build -t ft-nginx containers/nginx/.
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------Nginx docker image done--------------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 1
docker build -t ft-phpmyadmin containers/phpmyadmin/.
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------PhpMyadmin docker image done---------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 1
docker build -t ft-wordpress containers/wordpress/.
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------Wordpress docker image done----------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 1
docker build -t ft-influxdb containers/influxdb/.
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------Influxdb docker image done------------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 1
docker build -t ft-ftps containers/ftps/.
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------Ftps docker image done---------------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 1
docker build -t ft-grafana containers/grafana/.
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------grafana docker image done------------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 1


echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------Creating deployment and service------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 2

kubectl apply -f yaml/metallb.yaml
# kubectl apply -f yaml/influxdb-volume.yaml
# kubectl apply -f yaml/mysql-volume.yaml 
kubectl apply -f yaml/mysql.yaml
kubectl apply -f yaml/influxdb.yaml
kubectl apply -f yaml/ftps.yaml
kubectl apply -f yaml/nginx.yaml
kubectl apply -f yaml/phpmyadmin.yaml
kubectl apply -f yaml/wordpress.yaml
kubectl apply -f yaml/grafana.yaml
kubectl apply -f yaml/telegraf.yaml
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------Creating deployment and service DONE-------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"


kubectl get pods -o wide --watch
