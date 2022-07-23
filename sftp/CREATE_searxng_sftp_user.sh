#!/bin/sh

# This script is intended for use on a cloud server 
# (e.g. Amazon AWS, Vultr, DigitalOcean, AliBaba, etc).

clear

# Install SSH on server, if not already installed.
sudo apt update && sudo apt upgrade -y
sudo apt install ssh -y

#Create user with home directory.
sudo useradd -m -d /home/searxng searxng
# sudo mkdir -p /home/searxng/searxng-docker

# Prompt for password value.
sudo passwd searxng

# Assign correct permissions to folder and contained files. 
# See https://serverfault.com/questions/584986/bad-ownership-or-modes-for-chroot-directory-component/660180#660180
sudo chown root:root /home/searxng
sudo chmod 755 /home/searxng
sudo chown searxng:root /home/searxng/*
sudo chmod 775 -R /home/searxng/*

# Override existing default sshd_config.' 
sudo cat sshd_config_default.txt > /etc/ssh/sshd_config

# Restart SSH with sshd_config changes loaded.
sudo systemctl restart sshd