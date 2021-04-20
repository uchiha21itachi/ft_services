echo "Starting the Installation now ......"
sleep 2

echo "Deleting the existent minikube image"
minikube delete
minikube status
sleep 2

echo "Starting minikube with --vm-driver=docker --cpus=3"
minikube start --vm-driver=docker --cpus=3
echo "Minkube cluster started"
sleep 2

echo "Config docker daemon to point to minikube"
minikube ip
minikube docker-env 
eval $(minikube -p minikube docker-env)
docker images

echo "Installing mettalb and mettalb-namespace"
ls -l
pwd 
chmod +x metallb_setup.sh
bash metallb_setup.sh
echo "Metallb Config Done"
sleep 3

kubectl apply -f yaml/metallb.yaml
bash creator.sh


















































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
