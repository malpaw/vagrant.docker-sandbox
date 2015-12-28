#################################
# malpaw.vagrant.docker-sandbox #
# Vagrant provisioning script   #
#################################

# install prerequisuite components
cd

# install docker prerequisuites
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo bash -c "echo deb https://apt.dockerproject.org/repo ubuntu-vivid main > /etc/apt/sources.list.d/docker.list"
sudo bash -c "echo >> /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get purge lxc-docker
sudo apt-get install linux-image-extra-$(uname -r) -y

# install docker
sudo apt-get install docker-engine -y

# set service autostart
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable docker
sudo /bin/systemctl start docker

# set up user/group
sudo usermod -aG docker vagrant

# test it
docker run hello-world

