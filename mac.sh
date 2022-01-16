#!/bin/bash
#
# macOS Setup
#
# Ainsley Clark, ainsley.dev - 15/01/2022

# Variables
PHP_VERSION="7.4"
GOLANG_VERSION="1.17.5"

echo "************************************************"
echo "***    Welcome to the macOS System Setup     ***"
echo "************************************************"
echo ""

# Git Variables
echo "What name do you want to use in git user.name?"
read git_config_user_name

echo "What email do you want to use in git user.email?"
read git_config_user_email

# Install brew if not already
if ! hash brew
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  printf "\e[93m%s\e[m\n" "You already have brew installed, updating"
fi

# Update brew
brew update

# Curl / Wget
echo "Installing curl & wget"
brew install curl
brew install wget

# Git
echo "Installing git"
brew install git

echo "Setting up your git global user name and email"
git config --global user.name "$git_config_user_name"
git config --global user.email $git_config_user_email

echo "Copying global .gitignore file"
sudo cp ./git/.gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# Browser
echo "Installing browsers"
brew install --cask google-chrome
brew install --cask firefox
brew install --cask microsoft-edge

# Terminal replacement https://www.iterm2.com
echo "Installing iterm2"
brew install --cask iterm2

# Go
echo "Installing GoLang $GOLANG_VERSION"
brew install go@$GOLANG_VERSION

# Node/NPM/Typescript
echo "Installing node"
brew install node
sudo npm install -g typescript

# PHP
echo "Installing PHP $PHP_VERSION"
brew install php@$PHP_VERSION

# Python
echo "Installing python"
brew install python

# MySQL
echo "Installing NySQL and MySQL client"
brew install mysql
brew install mysql-client

# IDEs
echo "Installing IDEs"
brew install --cask visual-studio-code
brew install --cask goland
brew install --cask phpstorm
brew install --cask datagrip
brew install --cask webstorm

# Communication
echo "Installing communication apps"
brew install --cask slack
brew install --cask whatsapp
brew install --cask workplace-chat
brew install --cask zoom

# Dev tools
echo "Installing dev tools"
brew install bash
brew install zsh
brew install kubectl
brew install goreleaser
brew install hugo
brew install --cask postman

# Productivity
echo "Installing productivity apps"
brew install --cask simplenote
brew install --cask adobe-creative-cloud

# Music / Video
echo "Installing music and video apps"
brew install --cask spotify
brew install --cask vlc
brew install --cask plex

# Misc
echo "Installing misc"
brew install --cask transmission
brew install --cask carbon-copy-cloner
brew install --cask amd-power-gadget
brew install --cask geekbench
brew install --cask handbrake
brew install neofetch

# Image / Video Optimisation
echo "Installing image and video optimisation CLI's"
brew install webp
brew install optipng
brew install jpegoptim
brew install libavif
brew install ffmpeg

# Inject Envs
echo 'export PATH="/usr/local/opt/php@$PHP_VERSION/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/usr/local/opt/php@$PHP_VERSION/sbin:$PATH"' >> ~/.zshrc

# Oh My ZSH (Last)
echo "Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
zsh

echo ""
echo "************************************************"
echo "***    Finished, now run ./post-install      ***"
echo "************************************************"
