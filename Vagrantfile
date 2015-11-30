# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.hostname = "p-wordpress-web0"
  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/trusty64"
    web.vm.network "forwarded_port", guest: 80, host: 8080
    web.vm.provider "virtualbox" do |vbox|
      vbox.memory = "1024"
      vbox.cpus = 2
    end
  end
  config.vm.provision :ansible do |ansible|
  	ansible.playbook = "Playbook.yaml"
  end
end
