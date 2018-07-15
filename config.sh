#!/bin/bash

#######################################
# A personal script to install oh-my-zsh, configure .zshrc
# and install following plugins:
#   1. zsh-autosuggestions
#   2. zsh-syntax-highlighting 
##########################################

# Acquire oh-my-zsh
# Mac configuration
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Linux configuration
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install auto-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Configure vimrc
cp vimrc ~/.vimrc
