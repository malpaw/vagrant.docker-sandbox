#################################
# malpaw.vagrant.docker-sandbox #
# Vagrant configuration         #
#################################

Vagrant.require_version ">=1.6.0"

Vagrant.configure("2") do |config|

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 1
    end

	config.vm.box = "vivid-server-cloudimg-amd64"
	config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/vivid/current/vivid-server-cloudimg-amd64-vagrant-disk1.box"

	config.vm.hostname = "docker-sandbox"

	# config.vm.network :private_network, ip: "10.0.0.111"
    config.vm.network "forwarded_port", guest: 80, host: 8081

	# Exposes VM to local network.
	# Bridge it with ethernet interface in interactive mode.
	# config.vm.network "public_network"

	# Replace SMB shares with rsync
    # config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: [".git/", ".idea/"]

	config.vm.provision "shell", path: "provision.sh"
end

