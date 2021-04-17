
# -------------------------------SETUP 1 mysql-----------------------------
# # echo "------Setting up openrc--------"
# # openrc &> /dev/null
# # touch /run/openrc/softlevel


# echo '-----------Mysql SETUP-----------'
# mysql_install_db --user=mysql --datadir=/var/lib/mysql


# echo "----------Starting mariadb with rc-service ----------"
# # rc-service mariadb start
# # /usr/bin/mysqld_safe --datadir=/var/lib/mysql

# echo "------------Creating wordpress database----------"

# /usr/bin/mysqld --user=mysql --datadir=/var/lib/mysql --bootstrap <<EOF
  
#   FLUSH PRIVILEGES;
#   CREATE DATABASE wordpress;
#   CREATE USER 'root'@'%' IDENTIFIED BY 'yash';
#   GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'yash' WITH GRANT OPTION;
#   CREATE USER 'admin'@'%' IDENTIFIED BY 'yash';
#   GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'yash' WITH GRANT OPTION;
#   FLUSH PRIVILEGES;
# EOF

# echo "-------------------Creating Tables for wordpress------------"
# # mysql --user=root  wordpress < /wordpress.sql
# # /usr/bin/mysqld --user=root --init-file=/wordpress.sql
# /usr/bin/mysqld --socket=/var/lib/mysql/mysql.sock -u root wordpress  < wordpress.sql

# echo "------------------Starting mysqld-----------------"
# /usr/bin/mysqld 
# tail -F /dev/null

# -------------------------------SETUP 1 mysql-----------------------------
# echo "Initializing the openrc"

# # openrc &> /dev/null
# # touch /run/openrc/softlevel

# /etc/init.d/mariadb setup &> /dev/null
# echo "Mariadb setup done"

# service mariadb restart &> /dev/null
# echo "Maria db restarted now creating wordpress database.."
# mysql --user=root << EOF
  
#   FLUSH PRIVILEGES;
#   CREATE DATABASE wordpress;
#   CREATE USER 'root'@'%' IDENTIFIED BY 'yash';
#   GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'yash' WITH GRANT OPTION;
#   CREATE USER 'admin'@'%' IDENTIFIED BY 'yash';
#   GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'yash' WITH GRANT OPTION;
#   FLUSH PRIVILEGES;
  
# EOF

# echo "Creted the database wordpress .."

# mysql --user=root wordpress < /wordpress.sql

# printf "Database started !\n"
# /usr/bin/mysqld
# tail -F /dev/null



mysql_secure_installation <<EOF
n
n
y
y
y
y
EOF

# Modifying /etc/mysql/my.cnf

sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb restart

# setup database
# mysql < /tmp/conf.sql
mysql wordpress < /tmp/wordpress.sql

# generate an infinity loop to keep the container running
sleep infinity