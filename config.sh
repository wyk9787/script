#!/bin/bash

set -x # echo on

##########################################################
# A personal script which installs following:
# 1. Install zsh if necessary 
# 2. Copy over .zshrc and install following plugins:
#   a. zsh-autosuggestions
#   b. zsh-syntax-highlighting 
# 3. Install Vundle, a vim plugin manager 
# 4. Copy over .vimrc
# 5. Copy over following formatter config file
##########################################################

###########################################################
# Acquire oh-my-zsh
# Once oh-my-zsh is installed, this script needs to be rerun again since we
# are using zsh now

# TODO: Decide whether we are on mac or linux
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

# Install Vundle which is a plugin manager for vim
# Run `PluginInstall` in vim to install vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Copy vimrc to home directory
cp vimrc ~/.vimrc

# Copy formatter config files to home directory
cp clang-format ~/.clang-format
mkdir -p ~/.config/yapf && cp yapf_style ~/.config/yapf/style



