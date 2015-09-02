Vagrant.configure("2") do |config|
	
	# Specify the base box
	config.vm.box = "hashicorp/precise32"
	
	# Setup port forwarding
	config.vm.network :forwarded_port, guest: 80, host: 8932, auto_correct: true

    # Setup synced folder
    config.vm.synced_folder "./addon_name/", "/var/www/addons/addon_name", create: true, group: "www-data", owner: "www-data"

    # VM specific configs
    config.vm.provider "virtualbox" do |v|
    	v.name = "addon_name"
    	v.customize ["modifyvm", :id, "--memory", "1024"]
    end

    # Shell provisioning
    config.vm.provision "shell" do |s|
    	s.path = "provision/setup.sh"
    end
end
