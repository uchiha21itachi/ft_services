# rc-service vsftpd start & telegraf
# sleep infinity







if [ ! -d "/ftp/$FTPS_USER" ]
then
	mkdir -p /ftp/$FTPS_USER &> /dev/null
fi

echo -e "$FTPS_PASS\n$FTPS_PASS" | adduser -h /ftp/$FTPS_USER $FTPS_USER
chown $FTPS_USER:$FTPS_USER /ftp/$FTPS_USER

# -- Start FTP server ---
printf "FTPS server is starting !\n"
exec /usr/sbin/vsftpd -opasv_min_port=21000 -opasv_max_port=21004 -opasv_address=172.17.0.230 /etc/vsftpd/vsftpd.conf &
telegraf & tail -F /dev/null