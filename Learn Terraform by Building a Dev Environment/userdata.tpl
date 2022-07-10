#!/bin/bash

# Update APT
sudo apt-get update -y &&

# Install dependencies
sudo apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common &&

# Download the docker gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&

# Add the docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" &&

# Update after adding the docker repository
sudo apt-get update -y &&

# Install docker
sudo sudo apt-get install docker-ce docker-ce-cli containerd.io -y &&

# Add "ubuntu" to the docker group to allow you to run docker commands as the ubuntu user
sudo usermod -aG docker ubuntu