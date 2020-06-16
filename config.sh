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

###########################################################
# Acquire oh-my-zsh
# Once oh-my-zsh is installed, this script needs to be rerun again since we
# are using zsh now

# Install zsh if it's not installed yet
if ! [ -x "$(command -v zsh)" ]; then
  sudo apt-get install zsh
fi

# Install oh-my-zsh packagae
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

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

# Use zsh as the default shell
# The easiest way to do this on Linux
echo "zsh" >> ~/.bashrc


#####################################################
### Run `PlugInstall` from Vim to install plugins ###
#####################################################

# Copy formatter config files to home directory
cp clang-format ~/.clang-format
mkdir -p ~/.config/yapf && cp yapf_style ~/.config/yapf/style

# Install byobu
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get install byobu
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install byobu
fi

# Add git signature
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
