
echo "starting ......"

echo 'root:password' | chpasswd
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

openrc
echo "openrc done"
touch /run/openrc/softlevel
echo "touch done"



rc-service nginx start
echo "nginx start done"
rc-service sshd start
echo "sshd start done"

tail -F /dev/null
# 
# echo "Nginx started.............."
# echo "SSHD started.............."
# sleep 5

nginx -t 


# # Nginx & SSH starting
# echo "setting up openrc"
# openrc &> /dev/null
# touch /run/openrc/softlevel

# echo "Done openrc"
# nginx -t || exit 1
# # rc-service nginx start

# # /etc/init.d/sshd start



# #nginx -g 'daemon off'

# #echo "hello" 
# # /usr/sbin/sshd
