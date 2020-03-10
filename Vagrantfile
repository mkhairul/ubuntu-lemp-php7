# -*- mode: ruby -*-
# vi: set ft=ruby :

#require 'io/console'

if ARGV[0] == 'up' || ARGV[0] == 'provision'
	print "Enter Bitbucket Username: "
	bitbucket_username = STDIN.gets.chomp
	print "Password: "
	bitbucket_pass = STDIN.noecho(&:gets).chomp
end

#puts "Username: #{bitbucket_username}, Pass: #{bitbucket_pass}"
#exit

Vagrant.configure(2) do |config|

	config.vm.box = "bento/ubuntu-18.04"
    #config.vm.box = "bento/ubuntu-19.10"
    #config.vm.box_version = "201906.18.0"
    config.vm.box_check_update = true
    config.vbguest.auto_update = false
    config.vm.hostname = "lemp7"
    config.vm.define "lemp7"

    config.vm.network :forwarded_port, guest: 80, host: 8000
    config.vm.network :forwarded_port, guest: 3306, host: 3306
    #config.vm.network :forwarded_port, guest: 6379, host: 6381
    #config.vm.network :forwarded_port, guest: 27017, host: 27017

    config.vm.network "private_network", ip: "192.168.2.2"

    config.vm.provider :virtualbox do |v|
		v.name = "lemp7"
        v.customize ["modifyvm", :id, "--memory", "2048"]
        v.customize ["modifyvm", :id, "--vram", "32"]
	    v.customize ["modifyvm", :id, "--cpus", "2"]
    end
    
    # set project folder here:
    config.vm.synced_folder "../work", "/var/www"

    config.vm.provision "shell", path: "./scripts/setup.sh", privileged: false, args: [bitbucket_username, bitbucket_pass]
	config.vm.provision "integrate", type: "shell", run: "never", path: "./scripts/integrate.sh", privileged: false, args: [bitbucket_username, bitbucket_pass]
end
