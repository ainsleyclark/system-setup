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
echo "Installing curl"
apt-get install -y curl

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

# Chrome
echo "Installing Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb

# Edge
echo "Installing Edge"
apt install -y software-properties-common apt-transport-https
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main"
apt-get -y update && apt install -y microsoft-edge-dev

# Go
echo "Installing GoLang"
wget https://golang.org/dl/go1.17.5.linux-amd64.tar.gz
tar -C /usr/local -xvzf go1.16.7.linux-amd64.tar.gz

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

# VS Code
echo "Installing VS Code"
apt install software-properties-common apt-transport-https
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# Jetbrains
echo "Installing Jetbrains Toolbox"
curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash

# Dev tools
echo "Installing dev tools"

# GoReleaser
apt-get -y update && apt-get install hugo -y
echo 'deb [trusted=yes] https://repo.goreleaser.com/apt/ /' | sudo tee /etc/apt/sources.list.d/goreleaser.list
apt update && apt install goreleaser

# Kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Productivity
echo "Installing productivity apps"
# TODO Simplenote

# Spotify
echo "Installing Spotify"
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y

# VLC
echo "Installing VLC"
sudo apt-get install vlc -y
sudo apt-get install vlc-plugin-access-extra libbluray-bdj libdvdcss2 -y

# ZSH
echo 'Installing ZSH'
apt install zsh

# Image / Video Optim
echo "Installing image and video optimisation CLI's"

# Oh My ZSH (Last)
echo "Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Inject Envs
echo 'export PATH="/usr/local/opt/php@7.4/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/usr/local/opt/php@7.4/sbin:$PATH"' >> ~/.zshrc
zsh
