#!/bin/bash

set -x # echo on

##########################################################
# A personal script which installs following:
# 1. Install zsh if necessary 
# 2. Copy over .zshrc and install following plugins:
#   a. zsh-autosuggestions
#   b. zsh-syntax-highlighting 
# 3. Copy over .vimrc
# 4. Copy over following formatter config file
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

# Copy vimrc to home directory
cp vimrc ~/.vimrc

# One of the heaviest plugin is coc.nvim which requires the following:
#  1. vim >= 8.1 with python or python3 support
#    a. For Mac OS: `brew install vim` should have python support
#    b. For Linux: `git clone https://github.com/vim/vim.git`
#                  ./configure --enable-pythoninterp
#                  make
#                  sudo make install
#  2. yarn: 
#     a. Watch out apt-get may install another package rather than yarn
#     b. If that's the case, install Yarn from the source 
#     c. Note we need the latest version of node.js to have Yarn function
#     properly  
#     d. Run `yarn global add vim-node-rpc`
#
#  3. Oepn vim if it says "binary and build file not found" run:
#     `:call coc#util#build()`

#####################################################
### Run `PlugInstall` from Vim to install plugins ###
#####################################################

# Copy formatter config files to home directory
cp clang-format ~/.clang-format
mkdir -p ~/.config/yapf && cp yapf_style ~/.config/yapf/style



