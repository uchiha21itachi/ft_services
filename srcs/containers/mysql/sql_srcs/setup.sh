
# -------------------------------SETUP 1 mysql-----------------------------
echo "Initializing the openrc"

openrc &> /dev/null
touch /run/openrc/softlevel

telegraf & /etc/init.d/mariadb setup 
echo "Mariadb setup done"

sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf

service mariadb restart 
echo "Maria db restarted now creating wordpress database.."


mysql --user=root << EOF
  
  FLUSH PRIVILEGES;
  CREATE DATABASE wordpress;
  CREATE USER 'yash'@'localhost' IDENTIFIED BY 'yash';
  GRANT ALL PRIVILEGES ON wordpress.* TO 'yash'@'%' IDENTIFIED BY 'yash' WITH GRANT OPTION;
  CREATE USER 'admin'@'localhost' IDENTIFIED BY 'yash';
  GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'yash' WITH GRANT OPTION;
  FLUSH PRIVILEGES;

EOF

echo "Creted the database wordpress .."

mysql --user=root wordpress < /wordpress.sql

printf "Database started !\n"
# tail -F /dev/null

sleep infinity


# Try --user=root and without it
#















































#  GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'yash' WITH GRANT OPTION;
#   GRANT ALL PRIVILEGES ON *.* TO 'mysql'@'%' IDENTIFIED BY 'yash' WITH GRANT OPTION;
#   ALTER USER 'root'@'localhost' IDENTIFIED BY 'yash';
#   ALTER USER 'mysql'@'localhost' IDENTIFIED BY 'yash';
#  USE mysql;
#   DROP USER ''@localhost;
#   UPDATE user SET authentication_string=PASSWORD('yash') WHERE User='root';
#   UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE User='root';
