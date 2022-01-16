#!/bin/bash

# Post Install
brew services start mysql
mysql_secure_installation

# Copy custom functions & aliases
cp ./zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
cp ./zsh/functions.zsh ~/.oh-my-zsh/custom/functions.zsh
zsh
