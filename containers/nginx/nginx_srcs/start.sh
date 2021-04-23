
echo "starting ......"
echo "Starting sshd in /usr/sbin/sshd ......."
/usr/sbin/sshd
echo "sshd started"
echo "Starting nginx ........"
telegraf & nginx -g "daemon off;"
nginx -t 
echo "all done"
tail -F /dev/null
