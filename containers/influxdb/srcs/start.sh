echo "Strating the setup"
service influxdb start
echo "service influxdb started"
echo "CREATE DATABASE influxdb" | influx

echo "CREATE USER yash WITH PASSWORD yash WITH ALL PRIVILEGES" | influx
echo "CREATE USER mohit WITH PASSWORD mohit WITH ALL PRIVILEGES" | influx

telegraf & tail -f /dev/null