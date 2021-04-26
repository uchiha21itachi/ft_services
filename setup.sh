
echo "-------------------------------Installing filezilla---------------------------------------"
sudo apt-get install filezilla -y
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------Starting the Installation now--------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 2

echo "------------------------------------------------------------------------------------------"
echo "-----------------------------Deleting the existent minikube image-------------------------"
echo "------------------------------------------------------------------------------------------"
minikube delete
echo $?

minikube status
sleep 2

echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "--------------------------Deleted the old minikube image----------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "---------------------Starting minikube with --vm-driver=docker --cpus=3-------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
minikube start --vm-driver=docker --cpus=2
echo $?

echo "------------------------------------------------------------------------------------------"
echo "------------------------------------Minkube cluster started-------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 2

echo "------------------------------------------------------------------------------------------"
echo "----------------------------Config docker daemon to point to minikube---------------------"
echo "------------------------------------------------------------------------------------------"
minikube ip
minikube docker-env 
eval $(minikube -p minikube docker-env)
docker images


echo "------------------------------------------------------------------------------------------"
echo "----------------------------Installing mettalb and mettalb-namespace----------------------"
echo "------------------------------------------------------------------------------------------"


echo "Installing NameSpace"
echo "----------------------"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
echo "Done -------------"
echo "Installing mettallb now .............."
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
echo "done ------------"
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
echo "Finishing setup"



echo "------------------------------------------------------------------------------------------"
echo "------------------------------------Metallb Config Done-----------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 3

echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "---------------------------------Building docker images-----------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"

docker build -t ft-mysql containers/mysql/. 
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------Mysql docker image done--------------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 1
docker build -t ft-nginx containers/nginx/.
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------Nginx docker image done--------------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 1
docker build -t ft-phpmyadmin containers/phpmyadmin/.
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------PhpMyadmin docker image done---------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 1
docker build -t ft-wordpress containers/wordpress/.
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------Wordpress docker image done----------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 1
docker build -t ft-influxdb containers/influxdb/.
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------Influxdb docker image done------------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 1
docker build -t ft-ftps containers/ftps/.
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------Ftps docker image done---------------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 1
docker build -t ft-grafana containers/grafana/.
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------grafana docker image done------------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 1


echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------Creating deployment and service------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
sleep 2

kubectl apply -f yaml/metallb.yaml

kubectl apply -f yaml/influxdb-volume.yaml
kubectl apply -f yaml/mysql-volume.yaml

kubectl apply -f yaml/mysql.yaml
kubectl apply -f yaml/influxdb.yaml
kubectl apply -f yaml/ftps.yaml
kubectl apply -f yaml/nginx.yaml
kubectl apply -f yaml/phpmyadmin.yaml
kubectl apply -f yaml/wordpress.yaml
kubectl apply -f yaml/grafana.yaml
kubectl apply -f yaml/telegraf.yaml
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "-----------------------------Creating deployment and service DONE-------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------"
minikube dashboard


















































# echo "Hello installation in process.......";
# sleep 10;

# #Updating everything before install

# sudo apt-get update -y
# sudo apt-get upgrade -y

# #I should probably remove already existing versions 
# echo "Installing curl, certificates, software-property common";
# sleep 10;

# # sudo apt-get install curl -y
# # sudo apt-get install apt-transport-https -y
# # sudo apt-get install ca-certificates -y
# # sudo apt-get install software-properties-common -y

# #Install Docker 
# # First add the GPG key for the official Docker repository to your system.
# #curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# # Add the Docker repository to APT sources.
# #sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# # Next, update the package database with the Docker packages from the newly added repo.
# #sudo apt update

# # Make sure you are about to install from the Docker repo instead of the default Ubuntu repo.
# #apt-cache policy docker-cesudo

# # Finally, install Docker.
# #sudo apt-get install docker-ce

# # Docker should now be installed, the daemon started, and the process enabled to start on boot.
# # Check that it’s running.
# #sudo systemctl status docker

# # To avoid typing sudo whenever you run the docker command, add your username to the docker group:
# #sudo usermod -aG docker $(whoami);

# # To apply the new group membership, log out of the server and back in, or type the following.
# #su - ${USER}

# # You will be prompted to enter your user’s password to continue.
# # Confirm that your user is now added to the docker group by typing.
# #id -nG

# # Using docker consists of passing it a chain of options and commands followed by arguments.
# #docker [option] [command] [arguments]

# # To view all available subcommands, type:
# #docker

# echo "Installing Virtualbox.....My personal messege \n\n\n\n";
# sleep 10;
# #Install Virtualbox Hypervisor and FileZilla
# sudo apt install virtualbox virtualbox-ext-pack -y
# sudo apt-get install filezilla -y
# #Virtualbox extension have some manual yes or no while installing. Needs to be automated


# echo "Startting the Minikube installation now ....\n\n\n\n"
# sleep 10;

# #Installing Minikube and copying it to correct dir
# wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
# sudo cp minikube-linux-amd64 /usr/local/bin/minikube
# sudo chmod 755 /usr/local/bin/minikube


# echo "Installation done..... Exiting the interface";
# echo "Checking Minikube version now ..."
# sleep 10;
# minikube version
# sleep 10;

# echo "Starting the minikube now"
# # minikube start --vm-driver=virtualbox
