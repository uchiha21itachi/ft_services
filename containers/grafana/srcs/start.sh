echo "starting"

telegraf & grafana-server --homepath=/usr/share/grafana/ --config=/usr/share/grafana/conf/grafana.ini
sleep infinity