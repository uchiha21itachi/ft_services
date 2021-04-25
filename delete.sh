echo "Starting to delete the config...."
kubectl delete -f yaml/telegraf-new.yaml
kubectl delete -f yaml/ftps.yaml
kubectl delete -f yaml/wordpress.yaml
kubectl delete -f yaml/phpmyadmin.yaml
kubectl delete -f yaml/nginx.yaml
kubectl delete -f yaml/grafana.yaml
kubectl delete -f yaml/influxdb.yaml
kubectl delete -f yaml/mysql.yaml
kubectl delete -f yaml/metallb.yaml
sleep 1
