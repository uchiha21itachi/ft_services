# sed -i.bak "s/\(define('WP_SITEURL', \).*/\1'http:\/\/$(minikube ip):5050\/');/g"  /var/www/wordpress/wp-config.php
# sed -i.bak "s/\(define('WP_HOME', \).*/\1'http:\/\/$(minikube ip):5050\/');/g"  /var/www//wordpress/wp-config.php 
# rm /var/www//wordpress/wp-config.php.bak

php -S 0.0.0.0:5050 -t /www/wordpress/
