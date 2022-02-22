#!/bin/bash

echo "======== [1] Update ================="
apt update
#apt dist-upgrade -y

echo "======== [2] Install packeges ======="
apt install vim -y
# apt install openssh-server

echo "======== [3] Hosts =================="
echo "192.168.20.40 foreman.example.com" | tee -a /etc/hosts

echo "======== [4] Puppet ================="
wget https://apt.puppet.com/puppet6-release-focal.deb
apt install ./puppet6-release-focal.deb
#  Сам puppetmaster не устанавливаем, он будет установлен автоматически при установке Foreman.

echo "======== [5] Foreman ================"
apt install gpg -y
echo "deb http://deb.theforeman.org/ focal 3.0"   | tee /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 3.0" | tee -a /etc/apt/sources.list.d/foreman.list
wget -q https://deb.theforeman.org/pubkey.gpg -O- | apt-key add -

echo "======== [6] Update ================="
apt update

echo "======== [7] Foreman: install installer  =========="
apt install foreman-installer -y
# foreman-installer — это пакет который позволяет установить Foreman.

echo "======== [8] Foreman: start installer  ============"
foreman-installer