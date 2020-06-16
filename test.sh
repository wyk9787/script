#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color
function color_print () {
  printf "${RED}$1${NC}\n" 
}

color_print "THIS SCRIPT IS FOR DEBUGGING PURPOSE ONLY!"

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

ask_for_confirmation "About to install oh-my-zsh. 
You need to type \"exit\" to finish installing the rest of the script once oh-my-zsh is installed. 
Please confirm (y/n): "

printf "I ${RED}love${NC} Stack Overflow\n"


function preinstall_print() {
  color_print "Installing $1..."
}

function postinstall_print() {
  color_print "Done installing $1.\n"
}

postinstall_print "zsh"
preinstall_print "zsh"


