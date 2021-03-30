mkdir -p /run/mysqld
mkdir -p /var/lib/mysql

if [ ! -d /var/lib/mysql/mysql ]
then
    echo '-----------INSTALL-----------'
    mysql_install_db --user=root --datadir=/var/lib/mysql

    echo '-----------SETUP-----------'
    /usr/bin/mysqld --user=root --datadir=/var/lib/mysql --bootstrap <<EOF
FLUSH PRIVILEGES;
CREATE DATABASE wordpress;
CREATE USER 'root'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%' IDENTIFIED BY 'root';
FLUSH PRIVILEGES;
EOF

    echo '-----------SETUP WORDPRESS-----------'
    /usr/bin/mysqld --user=root --datadir=/var/lib/mysql --bootstrap < /wordpress.sql
fi

echo '-----------DEAMON-----------'
exec /usr/bin/mysqld --user=root --datadir=/var/lib/mysql
