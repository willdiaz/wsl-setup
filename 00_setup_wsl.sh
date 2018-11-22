#!/usr/bin/env bash

echo ""
echo "==========================================================="
echo "You are about to install several applications,"
echo "including node.js, npm, nvm, angular cli, php and composer."

read -p 'Would you like to continue? [y/N]' answer

# END THE SCRIPT IF THE USER WANTS TO
if [ "$answer" != "y" ] && [ "$answer" != "Y" ]
then
    exit
fi

# CREATE BASH ALIASES
# https://stackoverflow.com/questions/7131670/make-a-bash-alias-that-takes-a-parameter
if [ ! -f ~/.bash_aliases ]; then
    touch ~/.bash_aliases
    echo "alias ll='ls -alF'" > ~/.bash_aliases
    # https://superuser.com/questions/313938/shell-script-echo-new-line-to-file
    echo -e 'mcd() {\n  mkdir "$1"\n  cd "$1"\n}' >> ~/.bash_aliases
fi

# RUN THE INSTALL SCRIPTS
echo "==========================="
echo "1. Update your Linux distro"
./01_setup_deb.sh

echo "============================"
echo "2. Install Node, NPM and NVM"
./02_install_npm.sh

echo "======================"
echo "3. Install Angular CLI"
./03_install_angular_cli.sh

echo "==========================="
echo "4. Install PHP and Composer"
./04_install_php.sh
