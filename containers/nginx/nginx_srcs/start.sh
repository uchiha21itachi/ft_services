echo "starting ......"

echo 'root:password' | chpasswd
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config


# Creating SSL keys
# openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt

# Nginx setup
# adduser -D -g 'www' www
# chown -R www:www /var/lib/nginx
# chown -R www:www /www

# Nginx & SSH starting
openrc
touch /run/openrc/softlevel
service nginx start
service sshd start

tail -F /dev/null

echo "Nginx started.............."
echo "SSHD started.............."
sleep 10






# openrc
# touch /run/openrc/softlevel
#/etc/init.d/sshd start

nginx -t || exit 1
#nginx -g 'daemon off'

#adduser "/www" "$SSH_USER"
#echo "$SSH_USER:$SSH_PASSWORD" | chpasswd
#addgroup "$SSH_USER" www


#echo "hello" 
#/usr/sbin/sshd
#nginx -g "daemon off;"
