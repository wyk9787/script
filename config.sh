#!/bin/bash

##########################################################
# A personal script which installs following:
# 1. Install zsh if necessary 
# 2. Copy over .zshrc and install following plugins:
#   a. zsh-autosuggestions
#   b. zsh-syntax-highlighting 
# 3. Copy over .vimrc
# 4. Copy over following formatter config file
##########################################################

set -x # echo on 
set -e # exit immediately if any command failed

#######################################
# Ask for user's confirmation whether they want to proceed.
# Arguments:
#   Text to shown, a string.
#######################################
function ask_for_confirmation () {
  while true; do
    read -p "$1" yn
    case $yn in
        [Yy]* ) return 0;;
        [Nn]* ) exit;;
        * ) echo "Please answer y or n.";;
    esac
  done
}

RED='\033[0;31m'
NC='\033[0m' # No Color


#######################################
# Print text in red. A new line character will be added.
# Arguments:
#   Text to print, a string
#######################################
function color_print () {
  printf "${RED}$1${NC}\n" 
}

#######################################
# Print something before an app is intalled.
# Arguments:
#   App about to be installed, a string
#######################################
function preinstall_print() {
  color_print "Installing $1..."
}

#######################################
# Print something after an app is intalled. A new line is added at the end.
# Arguments:
#   App just finished installing, a string
#######################################
function postinstall_print() {
  color_print "Done installing $1.\n"
}

# Install zsh if it's not installed yet
if ! [ -x "$(command -v zsh)" ]; then
  preinstall_print "zsh"
  sudo apt-get install zsh
  postinstall_print "zsh"
fi

# Acquire oh-my-zsh
# Once oh-my-zsh is installed, user needs to enter "exit" to quit zsh to finish
# the remaining of the script.
ask_for_confirmation "About to install oh-my-zsh. 
You need to type \"exit\" to finish installing the rest of the script once oh-my-zsh is installed. 
Please confirm (y/n): "


# Install oh-my-zsh packagae
preinstall_print "oh-my-zsh"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
postinstall_print "oh-my-zsh"

preinstall_print "oh-my-zsh themes & plugins"
# Install theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Install auto-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
postinstall_print "oh-my-zsh themes & plugins"

color_print "Copying over zshrc and vimrc to home directory..."
# Copy zshrc to home directory
cp zshrc ~/.zshrc

# Copy vimrc to home directory
cp vimrc ~/.vimrc

color_print "Setting zsh to be the default shell by writing zsh to the end of bashrc..."
# Use zsh as the default shell
# The easiest way to do this on Linux
echo "zsh" >> ~/.bashrc

# # Copy formatter config files to home directory
# cp clang-format ~/.clang-format
# mkdir -p ~/.config/yapf && cp yapf_style ~/.config/yapf/style
# 
# # Install byobu
# if [[ "$OSTYPE" == "linux-gnu" ]]; then
#   sudo apt-get install byobu
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#   brew install byobu
# fi

# Add git signature
color_print "Adding git siganture..."
git config --global user.name "Garrett Wang"
git config --global user.email "garrettwang@google.com"


#########################################################
######### Instructions for installing CoC ###############
#########################################################
# One of the heaviest plugin is coc.nvim which requires the following:
#  1. vim >= 8.1 with python or python3 support
#    a. For Mac OS: `brew install vim` should have python support
#    b. For Linux: git clone https://github.com/vim/vim.git
#                  sudo apt-get install python3-dev
#                  ./configure \
#                    --enable-python3interp
#                    --with-python-config-dir=/usr/lib/python3.5 
#                    --enable-fail-if-missing
#                  make
#                  sudo make install
#  2. yarn: 
#     a. Watch out apt-get may install another package rather than yarn
#     b. If that's the case, install Yarn from the source 
#        https://yarnpkg.com/lang/en/docs/install/#debian-stable
#     c. Note we need the latest version of node.js to have Yarn function
#     properly
#        https://github.com/nodesource/distributions/blob/master/README.md
#     d. Run `yarn global add vim-node-rpc`
#
#  3. Oepn vim if it says "binary and build file not found" run:
#     `:call coc#util#build()`
#  
#  4. bear:
#      sudo apt-get install bear
#  
#  5. ccls
#    a. Install CMake from official website
#      cd ..
#      wget https://github.com/Kitware/CMake/releases/download/v3.14.0/cmake-3.14.0.tar.gz
#      tar xvf cmake-3.14.0.tar.gz
#      cd script
#    b. Follow the instructions on ccls wiki page
#
#  6. Install extensions and configurations in vim
#    a. `:CocInstall coc-json coc-java coc-html coc-highlight coc-pyls coc-snippets`
#    b. `:CocConfig`: copy paste in the following
#    {
#      "languageserver": {
#         "ccls": {
#           "command": "ccls",
#           "filetypes": ["c", "cpp", "objc", "objcpp"],
#           "rootPatterns": [".ccls", "compile_commands.json", ".vim/", ".git/", ".hg/"],
#           "initializationOptions": {
#              "cache": {
#                "directory": "/tmp/ccls"
#              }
#            }
#         }
#       }
#    }
#
