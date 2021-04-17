
# echo "starting ......"
# echo "Starting sshd in /usr/sbin/sshd ......."
# /usr/sbin/sshd
# echo "sshd started"
# echo "Starting nginx ........"
# nginx -g "daemon off;"
# nginx -t 
# echo "all done"
# tail -F /dev/null


echo "Service 'All': Status"

rc-status -a

echo "Service 'RSyslog': Starting ..."

rc-service rsyslog start







# openrc
# echo "openrc done"
# touch /run/openrc/softlevel
# echo 'root:password' | chpasswd
rc-service nginx start
echo "nginx start done"
rc-service sshd start
echo "sshd start done"

# 
# echo "Nginx started.............."
# echo "SSHD started.............."
# sleep 5



# # /etc/init.d/sshd start

