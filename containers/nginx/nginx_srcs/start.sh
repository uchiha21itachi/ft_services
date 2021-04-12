echo "starting ......"

echo 'root:password' | chpasswd
echo 'Password changed succesfully\n'

# Nginx & SSH starting
echo "setting up openrc"
openrc &> /dev/null
touch /run/openrc/softlevel

echo "Done openrc"
# rc-service nginx start

echo "addong user"
adduser "/www" "$SSH_USER"
echo "$SSH_USER:$SSH_PASSWORD" | chpasswd
addgroup "$SSH_USER" www

echo "addong user done"


# rc-service sshd start
echo "starting sshd"
/etc/init.d/sshd start

echo "done sshd"
tail -F /dev/null
# echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

# echo "Nginx started.............."
# echo "SSHD started.............."
sleep 10
nginx -t || exit 1








# openrc
# touch /run/openrc/softlevel


#nginx -g 'daemon off'

#echo "hello" 
#/usr/sbin/sshd
#nginx -g "daemon off;"


# Nginx setup
# adduser -D -g 'www' www
# chown -R www:www /var/lib/nginx
# chown -R www:www /www
