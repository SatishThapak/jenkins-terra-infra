#!/bin/bash

# Update system packages
sudo apt-get update

# Install OpenJDK 21 (headless version)
yes | sudo apt install openjdk-21-jdk-headless

# Pause before installing Jenkins
echo "Waiting for 30 seconds before installing Jenkins..."
sleep 30

# Add Jenkins repo and key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package lists again
sudo apt-get update

# Install Jenkins
yes | sudo apt-get install jenkins

# Pause before installing Terraform
echo "Waiting for 30 seconds before installing Terraform..."
sleep 30

# Download Terraform for Ubuntu (64-bit architecture)
wget https://releases.hashicorp.com/terraform/1.6.5/terraform_1.6.5_linux_amd64.zip

# Install unzip if not already installed
yes | sudo apt-get install unzip

# Unzip and move the Terraform binary
unzip terraform_1.6.5_linux_amd64.zip
sudo mv terraform /usr/local/bin/
