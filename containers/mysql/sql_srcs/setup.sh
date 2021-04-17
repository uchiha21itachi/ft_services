

# echo "------Setting up openrc--------"
# openrc &> /dev/null
# touch /run/openrc/softlevel


echo '-----------Mysql SETUP-----------'
mysql_install_db --user=mysql --datadir=/var/lib/mysql


echo "----------Starting mariadb with rc-service ----------"
# rc-service mariadb start
# /usr/bin/mysqld_safe --datadir=/var/lib/mysql

echo "------------Creating wordpress database----------"

/usr/bin/mysqld --user=mysql --datadir=/var/lib/mysql --bootstrap <<EOF
  
  FLUSH PRIVILEGES;
  CREATE DATABASE wordpress;
  CREATE USER 'root'@'%' IDENTIFIED BY 'yash';
  GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'yash' WITH GRANT OPTION;
  CREATE USER 'admin'@'%' IDENTIFIED BY 'yash';
  GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'yash' WITH GRANT OPTION;
  CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

  FLUSH PRIVILEGES;
EOF

# echo "-------------------Creating Tables for wordpress------------"
# mysql --user=root  wordpress < /wordpress.sql
# /usr/bin/mysqld  & mysql -u root wordpress  < wordpress.sql
# /usr/bin/mysqld --user=root --init-file=/wordpress.sql

echo "------------------Starting mysqld-----------------"
/usr/bin/mysqld 
tail -F /dev/null





# echo "starting mysqld daemon"
# /usr/bin/mysqld 

