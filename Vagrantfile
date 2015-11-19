# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

#require 'yaml'
####begin block Mysql credentional
#current_dir = File.dirname(File.expand_path(__FILE__))
#config_mysql = YAML.load_file("#{current_dir}/files_provision/config.yaml")
#admin_user = config_mysql['conf']['admin']['user']
#admin_pass = config_mysql['conf']['admin']['pass']
#wp_user = config_mysql['conf']['wordPress_user']['user']
#wp_pass = config_mysql['conf']['wordPress_user']['pass']
### finish block Mysql credentional

Vagrant.configure(2) do |config|
  config.vm.hostname = "p-wordpress-web0"
  config.vm.define "web" do |web|
    # boxes at https://atlas.hashicorp.com/search.
    web.vm.box = "ubuntu/trusty64"
    web.vm.synced_folder "D:/Vagrant_project/files_provision/", "/home/vagrant/files_provision"
    web.vm.synced_folder "D:/Vagrant_project/files_provision/WordPress/", "/var/www/html/", 
      owner: "root", group: "www-data"
    web.vm.network "forwarded_port", guest: 80, host: 8080
    web.vm.provider "virtualbox" do |vbox|
    vbox.memory = "512"
      vbox.cpus = 1
    end
  end

  config.vm.provision "shell", inline: <<-SHELL
  ### Configure local repo
    sudo python /home/vagrant/files_provision/configure_repo.py
  ### Preconf database
    debconf-set-selections <<< 'mysql-server mysql-server/root_password password Metallica21'
    debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password Metallica21'
  ### Install of required packages    
    sudo aptitude update
    sudo aptitude install -y --add-user-tag tag.apache2 apache2
    sudo aptitude install -y --add-user-tag tag.php php5 libapache2-mod-php5 php5-mcrypt php5-gd libssh2-php 
    sudo aptitude install -y --add-user-tag tag.htop htop
    sudo aptitude install -y --add-user-tag tag.mysql-server mysql-server php5-mysql
  ### Fixed bug with shadow symbols
    sed s/^M// /home/vagrant/files_provision/configure_mysql.sh > filename.tmp && mv filename.tmp /home/vagrant/files_provision/configure_mysql.sh
  ### Configure DB
    chmod +x /home/vagrant/files_provision/configure_mysql.sh
    sudo /bin/sh /home/vagrant/files_provision/configure_mysql.sh >>/tmp/mysql_setup.log
  ### Preparing of Wordpress application
# sudo cp -R /home/vagrant/files_provision/WordPress/ /var/www/html/ $$ sudo chown -R :www-data /var/www/html/*
    mkdir /var/www/html/wp-content/uploads && sudo chown -R :www-data /var/www/html/
    ### Preparing Apache2
    sudo sed -i s/index.html/index.php/g /etc/apache2/mods-enabled/dir.conf
    sudo sed -i s/index.php/index.html/2 /etc/apache2/mods-enabled/dir.conf
    service apache2 restart
  SHELL
end
