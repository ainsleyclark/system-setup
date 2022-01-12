#!/bin/bash

# Install brew
if ! hash brew
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
else
  printf "\e[93m%s\e[m\n" "You already have brew installed."
fi

# Curl / Wget
brew install curl
brew install wget

# Git
brew install git  

# Browser
brew install --cask google-chrome
brew install --cask firefox
brew install --cask microsoft-edge

# Terminal replacement https://www.iterm2.com
brew install --cask iterm2

# Communication
brew install --cask slack
brew install --cask whatsapp
brew install --cask workplace-chat
brew install --cask zoom

# Go
brew install go

# Node/NPM
brew install node

# PHP 
brew install php@7.4

# Python
brew install python

# MySQL
brew install mysql
brew install mysql-client

# Dev tools         
brew install bash
brew install zsh
brew install kubectl 
brew install goreleaser
brew install hugo
brew install --cask postman

# IDE's
brew install --cask visual-studio-code
brew install --cask goland
brew install --cask phpstorm
brew install --cask datagrip
brew install --cask webstorm

# Productivity
brew install --cask simplenote
brew install --cask adobe-creative-cloud

# Music / Video
brew install --cask spotify
brew install --cask vlc
brew install --cask plex

# Misc
brew install --cask transmission
brew install --cask carbon-copy-cloner
brew install --cask amd-power-gadget
brew install --cask geekbench
brew install --cask handbrake

# Image / Video Optim
brew install webp
brew install optipng
brew install jpegoptim
brew install libavif
brew install ffmpeg

# Oh My ZSH (Last)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Inject Env's
echo 'export PATH="/usr/local/opt/php@7.4/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/usr/local/opt/php@7.4/sbin:$PATH"' >> ~/.zshrc
zsh

# Post Install
brew services start mysql
mysql_secure_installation