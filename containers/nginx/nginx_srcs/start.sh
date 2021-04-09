echo "starting ......"

echo 'root:password' | chpasswd
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

#openrc
#touch /run/openrc/softlevel
#/etc/init.d/sshd start

nginx -t || exit 1
nginx -g 'daemon off'

#adduser "/www" "$SSH_USER"
#echo "$SSH_USER:$SSH_PASSWORD" | chpasswd
#addgroup "$SSH_USER" www


#echo "hello" 
#/usr/sbin/sshd
#nginx -g "daemon off;"
