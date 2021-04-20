

#  mkdir -p /run/mysqld
#  mkdir -p /var/lib/mysql

# #  chmod +x /var/lib/mysql
# #  chmod +x /usr/bin/mysqld

# # if [ ! -d /var/lib/mysql/mysql ]
# # then
# # 	echo '-----------INSTALL-----------'
# # 	mysql_install_db --user=root --datadir=/var/lib/mysql

# # 	echo '-----------SETUP-----------'
# # 	/usr/bin/mysqld --user=root --datadir=/var/lib/mysql --bootstrap <<EOF
# # FLUSH PRIVILEGES;
# # CREATE DATABASE wordpress;
# # CREATE USER 'root'@'%' IDENTIFIED BY 'root';
# # GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%' IDENTIFIED BY 'root';
# # FLUSH PRIVILEGES;
# # EOF

# # 	echo '-----------SETUP WORDPRESS-----------'
# # 	/usr/bin/mysqld --user=root --datadir=/var/lib/mysql --bootstrap < /wordpress.sql
# # fi

# # echo '-----------DEAMON-----------'
# # exec /usr/bin/mysqld --user=root --datadir=/var/lib/mysql

# # until mysql --socket="/var/lib/mysql/mysqld.sock" -u root < create_user.sql
# # do
# #           echo "MYSQL is not ready"
# #  done

# #  /usr/bin/mysql --socket="/var/lib/mysql/mysqld.sock" -u root < wordpress.sql
# # # # /usr/bin/mysql --socket="/var/lib/mysql/mysqld.sock" -u root < create_tables.sql
# #  /usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql/"
# #  /usr/bin/mysqld -u mysql


# --- ENV VARIABLES
# WP_USER_PASS <- password of wpuser dedicated for wordpress DB
# ADMIN_PASS <- Administrator password for all DB (login: admin)



# printf "Database started !\n"

# openrc &> /dev/null
# touch /run/openrc/softlevel
# /etc/init.d/mariadb setup &> /dev/null
# sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
# service mariadb restart &> /dev/null

# mysql --user=root << EOF
#   CREATE DATABASE wordpress;
#   CREATE USER 'wp_user'@'%' IDENTIFIED BY 'root';
#   GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
#   CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
#   GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION;
#   FLUSH PRIVILEGES;
# EOF

# mysql --user=root wordpress < /root/wordpress.sql


# tail -F /dev/null

mysql_install_db --user=mysql --ldata=/var/lib/mysql
/usr/bin/mysqld --console --init_file=/etc/mysql/config.sql
/usr/bin/mysqld --console --init_file=/etc/mysql/config.sql






---------------------------------------------------------------------------------------------------


# nohup ./mysql_start.sh > /dev/null 2>&1 &

openrc &> /dev/null
touch /run/openrc/softlevel
/etc/
# /etc/init.d/mariadb setup &> /dev/null

echo "mariaDB setup done. Now executing mysql_start,.sh"

service mariadb restart &> /dev/null
echo "Maria db restarted now creating wordpress database.."
mysql --user=root << EOF
  
  FLUSH PRIVILEGES;
  CREATE DATABASE wordpress;
  CREATE USER 'root'@'%' IDENTIFIED BY 'yash';
  GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'yash' WITH GRANT OPTION;
  CREATE USER 'admin'@'%' IDENTIFIED BY 'yash';
  GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'yash' WITH GRANT OPTION;
  FLUSH PRIVILEGES;
  
EOF

mysql --user=root wordpress < /wordpress.sql

printf "Database started !\n"

tail -F /dev/null


---------------------------------------------------------------------------------------------------



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


# echo "setup start..."
# /etc/init.d/mariadb setup
# echo "setuo done..."

# echo "starting maria..."
# /etc/init.d/mariadb start 2 /dev/null
# echo "Strat done...."

# echo "starting mysql_secure_installation"
# mysql_secure_installation <<EOF

# n
# n
# y
# y
# y
# y
# EOF

# echo "Mysql installation done....."
# Modifying /etc/mysql/my.cnf

# sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
# sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
# rc-service mariadb restart

# echo "Creating the wordpress database......."
# mysql --user=root << EOF
  
#   FLUSH PRIVILEGES;
#   CREATE DATABASE wordpress;
#   CREATE USER 'root'@'%' IDENTIFIED BY 'yash';
#   GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'yash' WITH GRANT OPTION;
#   CREATE USER 'admin'@'%' IDENTIFIED BY 'yash';
#   GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'yash' WITH GRANT OPTION;
#   FLUSH PRIVILEGES;
  
# EOF
# echo "Done with Creating the wordpress database......."

# echo "Applying the sql tables in databases...."
# # setup database
# # mysql < /tmp/conf.sql
# mysql wordpress < /tmp/wordpress.sql
# echo "Impoting table done "

# # generate an infinity loop to keep the container running
# sleep infinity
