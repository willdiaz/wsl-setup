#!/usr/bin/env bash

echo ""
echo "==========================================================="
echo "You are about to install several applications, including:"
echo "node.js, php, python3, mariadb,"
echo "npm, nvm, pip, git, composer, aws cli and angular cli."

read -p 'Would you like to continue? [y/N]' answer

# END THE SCRIPT IF THE USER WANTS TO
if [ "$answer" != "y" ] && [ "$answer" != "Y" ]
then
  exit
fi

# BYPASS SSL CHECK IF THE FLAG IS SET
$flag = ""
if [ $1 == "" ]
then
  $flag = "--no-check-certificate"
fi

# CREATE BASH ALIASES
# https://stackoverflow.com/questions/7131670/make-a-bash-alias-that-takes-a-parameter
# https://www.shellhacks.com/bash-test-if-file-exists/
test -f ~/.bash_aliases
if [ $? -eq 1  ]; then
    touch ~/.bash_aliases
    echo "alias ll='ls -alF'" > ~/.bash_aliases
    echo 'alias ..="cd .."' >> ~/.bash_aliases
    echo 'alias rebash="source ~/.bashrc"' >> ~/.bash_aliases
    echo 'mkcd() { mkdir "$1" && cd "$1"; }' >> ~/.bash_aliases
    echo 'untar() { tar -xvzf "$1"; }' >> ~/.bash_aliases
fi

# RUN THE INSTALL SCRIPTS
wget $flag https://raw.githubusercontent.com/willdiaz/wsl-setup/master/01_setup_deb.sh
test -f ./01_setup_deb.sh
if [ $? -eq 0 ]; then
    echo "==========================="
    echo "1. Update your Linux distro"
    ./01_setup_deb.sh
    rm ./01_setup_deb.sh
else
    echo "Distro setup script failed to download!"
fi

wget $flag https://raw.githubusercontent.com/willdiaz/wsl-setup/master/02_install_npm.sh
test -f ./02_install_npm.sh
if [ $? -eq 0 ]; then
    echo "============================"
    echo "2. Install Node, NPM and NVM"
    ./02_install_npm.sh
    rm ./02_install_npm.sh
else
    echo "NPM install script failed to download!"
fi

wget $flag https://raw.githubusercontent.com/willdiaz/wsl-setup/master/03_install_angular_cli.sh
test -f ./03_install_angular_cli.sh
if [ $? -eq 0 ]; then
    echo "======================"
    echo "3. Install Angular CLI"
    ./03_install_angular_cli.sh
    rm ./03_install_angular_cli.sh
else
    echo "Angular CLI setup script failed to download!"
fi

wget $flag https://raw.githubusercontent.com/willdiaz/wsl-setup/master/04_install_php.sh
test -f ./04_install_php.sh
if [ $? -eq 0 ]; then
    echo "==========================="
    echo "4. Install PHP and Composer"
    ./04_install_php.sh
    rm ./04_install_php.sh
else
    echo "PHP setup script failed to download!"
fi

wget $flag https://raw.githubusercontent.com/willdiaz/wsl-setup/master/05_install_mariadb.sh
test -f ./05_install_mariadb.sh
if [ $? -eq 0 ]; then
    echo "==========================="
    echo "4. Install MariaDB"
    ./05_install_mariadb.sh
    rm ./05_install_mariadb.sh
else
    echo "MariaDB setup script failed to download!"
fi

echo "Close the terminal, open a new window and type: command -v nvm"
echo "If you see 'nvm' displayed to you, then you are good to go!"
echo "Also, if you are going to use AWS CLI don't forget to run: aws configure"
