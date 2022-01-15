#!/bin/bash

echo "************************************************"
echo "***    Welcome to the Ubuntu System Setup    ***"
echo "************************************************"
echo ""

# Variables
echo "What name do you want to use in git user.name?"
read git_config_user_name

echo "What email do you want to use in git user.email?"
read git_config_user_email

# Updates
echo "Running updates"
sudo apt-get -y update
sudo apt-get -y upgrade

# Curl / Wget
echo "Installing curl & wget"
sudo apt-get install curl -y

# Updates
echo "Installing snap"
sudo apt install snapd

# Git
echo 'Installing latest git'
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update && sudo apt-get install git -y

# Browser
echo "Installing browsers"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main"
sudo apt install microsoft-edge-dev

# Go
echo "Installing GoLang"
sudo snap install go --classic

# Node/NPM
echo "Installing node"
sudo apt install nodejs

# PHP
echo "Installing php 7.4"
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt -y install php7.4

# Python
echo "Installing python"
sudo apt-get install python3-pip -y

# MySQL
echo "Installing NySQL and MySQL client"
sudo apt-get install mysql-server -y
sudo apt-get install mysql-client -y

# Nginx
echo "Installing Nginx"
sudo apt install nginx -y

# IDEs
echo "Installing IDEs"
sudo snap install code --classic
sudo snap install goland --classic
sudo snap install phpstorm --classic
sudo snap install datagrip --classic
sudo snap install webstorm --classic

# Dev tools
echo "Installing dev tools"
sudo snap install goreleaser --classic
sudo apt-get install hugo -y
sudo snap install postman

# Productivity
echo "Installing productivity apps"
sudo snap install simplenote

# Music / Video
echo "Installing music and video apps"
sudo snap install spotify
sudo snap install vlc

echo 'Installing ZSH'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

# Communication
echo "Installing communication apps"
sudo snap install slack --classic

# Image / Video Optim
echo "Installing image and video optimisation CLI's"

# Oh My ZSH (Last)
echo "Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Inject Envs
echo 'export PATH="/usr/local/opt/php@7.4/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/usr/local/opt/php@7.4/sbin:$PATH"' >> ~/.zshrc
zsh