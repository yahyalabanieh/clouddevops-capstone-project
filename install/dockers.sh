#!/usr/bin/env bash

# Install Docker CE
apt-get -y install docker-ce

# Give permission to user Jenkins to run dockers
sudo usermod -a -G docker jenkins

# Restart Jenkins
systemctl restart jenkins
