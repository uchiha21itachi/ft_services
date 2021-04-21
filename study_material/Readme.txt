Docker basics command white_check_mark
# Build a docker image from a Dockerfile
docker build -t <your image name> <your Dockerfile dir>

# Start an instance of a docker image
docker run -it <your image name>
# Really important if you want to bind some ports on the container to your own computer, use -p option.
# Exemple for an Apache image using port 80 in the container as our port 80
docker run -it debian:apache -p80:80

# See all images
docker images

# See running containers
docker ps

# Stop a container
docker kill <container ID>

# Delete all unused Docker images and cache and free SO MUCH SPACE on your computer
docker system prune
How to manage pods with Kubernetes white_check_mark
# Create a pod from a YAML file
kubectl create -f <yourfile.yaml>

# Delete a pod
kubectl delete deployment <your deployment>
kubectl delete service <your service>
# and so on if you have different objects

# Get a shell in a pod
# First get the pod full name with:
kubectl get pods
# Then, your pod name should look like "grafana-5bbf569f68-svdnz"
kubectl exec -it <pod name> -- /bin/sh

# Copy data to pod or to our computer
kubectl cp <pod name>:<file> <to>
# or vice versa
kubectl cp <from> <pod name>:<to>

# Restart a deployment
kubectl rollout restart deployment <name>

# Launch minikube dashboard
minikube dashboard

# Get cluster external IP
minikube ip

# Reset Minikube VM
minikube delete
How IPs are managed with Kubernetes robot
Kubernetes will create a network that connects all your containers. Each container will have its own private IP address. The network has an external IP. You can get it with "minikube ip". Sometimes, you want a container to connect another. For exemple, if you have a website in a container that needs a database from an other container, you need to create a service, which will create an easy-access to the database container.

From inside your Kubernetes network (from container to an other container), you can access a service by its name, and not its IP. For exemple, you have a service "mysql" linked to a MySQL container. To access this container from a Nginx container, you can try:

mysql <database> -u <user> -p -h mysql
# Normally, we access with IP like that:
mysql <database> -u <user> -p -h 127.0.0.10
An other example, you have a web page hosted on port 1000, with a service named "test". You minikube ip is 192.168.0.1.

# Access the webpage from containers
curl http://test:1000
# Access the webpage from outside (your computer, remotely)
curl http://192.168.0.1:1000
Link Minikube and Docker link
Minikube creates a specific VM in VirtualBox that will run your Docker images. You need to link your shell with the Minikube context. You can achieve that with the command:

eval $(minikube docker-env)
You can test in which context you are by running:

docker images
You can see all images linked to the current context that can help you identify were you are.

By default, Kubernetes deployment looks for online Docker images, but we want it to load our custom local images. You can do that by adding "imagePullPolicy: Never" prop in your container object.

Containers technologist
Nginx
Nginx is a web server that can provide web pages and execute PHP (a language for web backend). You need to create a simple Nginx server, it has to be fetchable through Ingres, which is a more advanced version of service. Port 443 is for SSL connection (https). You can create a SSL certificate with Openssl. This container needs to provide a SSH connection. SSH is used to access a computer remotly through a shell. A really simple way to create a SSH server is through the openssh package and then run the sshd daemon.

FTPs
A simple FTPs server. FTP is a protocol to send and download files from a distant computer. FTPs is a version that uses SSL to encrypt communications between the client and the server, which is safer. Pure-FTPD is a simple FTP server. You can test a FTP connection with:

ftp <user>@<ip>
Wordpress
Wordpress is the #1 open source website and blog content manager. It's written in PHP, and uses MySQL as database. MySQL is the most used SQL database, SQL is a language to query data. You'll need to use a web server, you can reuse Nginx. Your wordpress database (you'll need to import it in MySQL) contains the website IP information, which has to match the IP you access it from. You'll need to input the Minikube IP to the wordpress SQL database. Wordpress also has a wp-config.php file that you'll need to edit so it can access your MySQL service.

You can test a remote MySQL connection with:

# -p only if your user has a password
mysql <database name> -u <user> -p -h <ip>
PHPMyAdmin
PHPMyAdmin is a useful tool to view, query, and edit data from a MySQL database. It can be hosted by any web server, so I recommand you to use Nginx as well as you've used it before. You need to edit phpmyadmin.inc.php file to connect to your MySQL service.

Grafana
Grafana is a web dashboard used to visualize data, like a cluster health. It can automatically fetch data from various sources, but we'll use InfluxDB, which is a database engine.

You can test an InfluxDB connection by fecthing /ping endpoint:

curl http://influxdb:8086/ping
curl http://192.168.0.29/ping
We'll send all container data (CPU usage, memory, processes) easily by using Telegraf. It's a simple program that sends system data to an InfluxDB instance.

So our stack is: Telegraf --> InfluxDB --> Grafana Get data Store data Visualize Data

So there are two connections to configure, Telegraf to InfluxDB which is done in the /etc/telegraf/telegraf.conf file and the Grafana to InfluxDB which is done from the Grafana web interface.

To provide an already-configured version of Grafana, I advise you to setup a blank Grafana setup, launch you container, configure everything. Then save the grafana.db file on your computer (you can use "kubectl cp" to get data from a running pod). You can now copy this file in your Dockerfile.

Useful resources spider_web
To build Grafana + InfluxDB + Telegraf stack: https://medium.com/@nnilesh7756/copy-directories-and-files-to-and-from-kubernetes-container-pod-19612fa74660
Kubernetes cheat sheet: https://kubernetes.io/fr/docs/reference/kubectl/cheatsheet/
Questions ? Suggestions ? mailbox_closed
Tom Marx tmarx on the intra and slack :)










//

Project helpers

#Apk commands for Dockerfile
https://www.cyberciti.biz/faq/10-alpine-linux-apk-command-examples/?__cf_chl_captcha_tk__=d4f70a4477f62ed0695fb553bc84bcf1d179ac87-1615737840-0-Ae7W6sqYnceXHXCBsZuZw_5oEh12XvkhJ4R-4CW230dCxHFem22oDgzjKEzTy5wCTReh8dhHj60W1wGJT6-sQrGc--XeS1aahul156WkAigR-dHMjhWczYbW9yhmvviiO5ZceI1t4ZgGJE5pu7j4J2sQdbptyHTD4IEBsbCg_SZHmvx5LQX7e1DYd9JjuyRB6wpsEAwUIOTb7xZhjwTI0KOw4n27bVHMn6noOzTBnQlpVrs3HZHjdiAcik6G7k-RbUeAJ-4rm2ZBMGpmqFaki1W3Nra_w2tf2YzJQrtW6N8Pu6ac5_d5KhNPcaqZHXnWbd9gTYRVVUxnt_FqCkiCg6lGLoJUYuyP1mYysaBUOlcYYAsVjC3mWa5vVAD-FwsfZtfieRVTzUgI34kPElqQ4ONV0YP-yR_PDMBNoZ8WAwLDGR-hlUIGy1Vt1i04i0QhR7IDZaLbuIvjHJKymcXUxvzjRqK_6DUPtE4PDZvrXcek8yul7xYCgGNauZpcKNAU-yrEkDDX1PuZqX7uqn1KbuDPppukOTO77ihbV39nyqeI_dhsDz1QYdbWNkF3LXXg6rFAkcO19nWd-9c8OKG3kpu1xmoqRhRXrvSXShvDJ0S-sZcLGr_CeCLyvQbIOvGmLDguewxdwCpI8hwxVJxMzqM

#Nginx helpers
http://nginx.org/en/docs/beginners_guide.html


https://hub.docker.com/_/nginx
https://www.linode.com/docs/guides/how-to-configure-nginx/

//ssh guide
https://guide.ubuntu-fr.org/server/openssh-server.html

#Wordpress 
https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/


https://kubernetes.io/docs/tutorials/stateless-application/expose-external-ip-address/

#InfluxDB
https://octoperf.com/blog/2019/09/19/kraken-kubernetes-influxdb-grafana-telegraf/#tl-dr

#Project for reference
https://github.com/cclaude42/ft_services

#Tips for defence in 42 VM linux
https://www.notion.so/Ft_services-VM-852d4f9b0d9a42c1a2de921e4a2ac417
vboxmanage modifyvm english-version-testing  --nested-hw-virt on



