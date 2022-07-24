#!/bin/sh

# This script is intended for use on a cloud server 
# (e.g. Amazon AWS, Vultr, DigitalOcean, AliBaba, etc).

clear

# Remove and purge SSH on server, if not already installed.
# Below command also removes /etc/ssh/sshd_config
sudo apt --purge remove openssh-server -y

# Remove created user for SFTP / SSH.
sudo userdel searxng

# Keep user home directory by default. 
# Assign permissions to 'ubuntu' user.
sudo chown root:root /home/searxng
sudo chown ubuntu:root /home/searxng/*