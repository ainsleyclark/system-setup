#!/bin/bash
#
# Ubuntu Setup
#
# Ainsley Clark, ainsley.dev - 15/01/2022

echo "************************************************"
echo "***    Welcome to the Ubuntu System Setup    ***"
echo "************************************************"
echo ""

# Check if root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Variables
echo "What name do you want to use in git user.name?"
read git_config_user_name

echo "What email do you want to use in git user.email?"
read git_config_user_email

# Updates
echo "Running updates"
apt-get -y update
apt-get -y upgrade

# Curl / Wget
echo "Installing curl & wget"
apt-get install curl -y

# Git
echo 'Installing latest git'
add-apt-repository ppa:git-core/ppa -y
apt-get -y update && apt-get install git -y

echo "Setting up your git global user name and email"
git config --global user.name "$git_config_user_name"
git config --global user.email $git_config_user_email

echo "Copying global .gitignore file"
cp ./git/.gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# Browser
echo "Installing browsers"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb
apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main"
apt-get -y update && apt install microsoft-edge-dev

# Go
echo "Installing GoLang"
snap install go --classic

# Node/NPM
echo "Installing node"
apt-get -y update && apt install nodejs -y

# PHP
echo "Installing php 7.4"
apt -y install software-properties-common
add-apt-repository ppa:ondrej/php
apt-get -y update && apt -y install php7.4

# Python
echo "Installing python"
apt-get install python3-pip -y

# MySQL
echo "Installing NySQL and MySQL client"
apt-get install mysql-server -y
apt-get install mysql-client -y

# Nginx
echo "Installing Nginx"
apt-get -y update && apt install nginx -y

# IDEs
echo "Installing IDEs"
snap install code --classic
snap install goland --classic
snap install phpstorm --classic
snap install datagrip --classic
snap install webstorm --classic

# Dev tools
echo "Installing dev tools"
snap install goreleaser --classic
apt-get -y update && apt-get install hugo -y
snap install postman

# Productivity
echo "Installing productivity apps"
snap install simplenote

# Music / Video
echo "Installing music and video apps"
snap install spotify
snap install vlc

echo 'Installing ZSH'
apt-get -y update && apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

# Communication
echo "Installing communication apps"
snap install slack --classic

# Image / Video Optim
echo "Installing image and video optimisation CLI's"

# Oh My ZSH (Last)
echo "Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Inject Envs
echo 'export PATH="/usr/local/opt/php@7.4/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/usr/local/opt/php@7.4/sbin:$PATH"' >> ~/.zshrc
zsh
