# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "4096"
    vb.cpus = 2
  end

  # server
  config.vm.define "foreman" do |foreman|
    foreman.vm.box = "peru/ubuntu-20.04-server-amd64"
    foreman.vm.hostname = 'foreman.example.com'
    foreman.vm.network "private_network", ip: "192.168.20.40"
    foreman.vm.provision "shell", path: "script/server.sh"
    foreman.vm.network "forwarded_port", id: "foreman", guest: 443, host: 10443, guest_ip: "192.168.20.40", host_ip: "127.0.0.1", protocol: "tcp"
  end

  # PC1
  config.vm.define "pc1" do |pc1|
    pc1.vm.box = "peru/ubuntu-20.04-server-amd64"
    pc1.vm.hostname = 'pc1.example.com'
    pc1.vm.network "private_network", ip: "192.168.20.41"
  end

end