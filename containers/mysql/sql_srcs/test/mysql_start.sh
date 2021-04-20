until mysql
do
    echo "no up"
done

echo " FLUSH PRIVILEGES;" | mysql -u root --skip-password
echo " CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo " CREATE USER 'root'@'%' IDENTIFIED BY 'yash';" | mysql -u root --skip-password
echo " GRANT ALL PRIVLIGES ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'yash' WITH GRANT OPTION;" | mysql -u root --skip-password
echo " CREATE USER 'admin'@'%' IDENTIFIED BY 'yash';" | mysql -u root --skip-password
echo " GRANT ALL PRIVLIGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'yash' WITH GRANT OPTION;" | mysql -u root --skip-password
echo " FLUSH PRIVILEGES;" | mysql -u root --skip-password
mysql wordpress -u root < wordpress.sql