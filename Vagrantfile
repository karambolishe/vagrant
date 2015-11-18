# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.define "web" do |web|
    # boxes at https://atlas.hashicorp.com/search.
    web.vm.box = "ubuntu/trusty64"
    web.vm.synced_folder "D:/Vagrant_project/files_provision/", "/home/vagrant/files_provision"
    web.vm.network "forwarded_port", guest: 80, host: 8080
    web.vm.hostname "p-wordpress-web0"
    web.vm.provider "virtualbox" do |vbox|
    vbox.memory = "512"
      vbox.cpus = 1
    end
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo python /home/vagrant/files_provision/configure_repo.py
    sudo aptitude update
    sudo aptitude install -y nginx; sudo aptitude install -y htop
  SHELL
end
