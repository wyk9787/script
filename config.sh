#!/bin/bash

##########################################################
# A personal script to install oh-my-zsh, configure .zshrc
# and install following plugins:
#   1. zsh-autosuggestions
#   2. zsh-syntax-highlighting 
#
# Also install vim-plug, which is a vim plugin manager and install
# corresponding vim plugins
##########################################################

###########################################################
# Acquire oh-my-zsh
# Onece oh-my-zsh is installed, this script needs to be rerun again since we
# are using zsh now

# Make sure zsh is installed already, otherwise run the following line
# sudo apt-get install zsh

# Mac configuration
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Linux configuration
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
###########################################################

# Install theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Install auto-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copy zshrc to home directory
cp zshrc ~/.zshrc

# Install vim-plug which is a plugin manager for vim
# If curl is not installed, then go to the github repo and download plug.vim
# into ~/.vim/autoload
#
# Run `PlugInstall` in vim to install vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


