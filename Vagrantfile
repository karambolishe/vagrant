# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.hostname = "p-wordpress-web0"
  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/trusty64"
    if ENV['ENV'] != 'linux'
      web.vm.synced_folder "D:/Vagrant_project/files_provision/", "/home/vagrant/files_provision"
    else
      web.vm.synced_folder "~/Karambol/learning/devops/devops_course/gitlab_academy/devopslab/vagrant_karambolishe/files_provision/", "/home/vagrant/files_provision"
    end
    web.vm.network "forwarded_port", guest: 80, host: 8080
    web.vm.provider "virtualbox" do |vbox|
      vbox.memory = "1024"
      vbox.cpus = 2
    end
  end
  if ENV['ENV'] != 'linux'
    config.vm.provision "shell", path: "files_provision/configure_repo.sh"
    config.vm.provision "shell", path: "files_provision/postinstall_wp.sh"
  else
    config.vm.provision "shell", path: "files_provision/postinstall_wp.sh"
  end
end