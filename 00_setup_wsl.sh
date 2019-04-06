#!/usr/bin/env bash

echo ""
echo "==========================================================="
echo "You are about to install several applications, including:"
echo "node.js, php, python3, mariadb, npm, nvm, pip, git, composer, aws cli and angular cli."

read -p 'Would you like to continue? [y/N]' answer

# END THE SCRIPT IF THE USER WANTS TO
if [ "$answer" != "y" ] && [ "$answer" != "Y" ]
then
  exit
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
wget $1 https://raw.githubusercontent.com/willdiaz/wsl-setup/master/01_setup_deb.sh
test -f ./01_setup_deb.sh
if [ $? -eq 0 ]; then
    chmod u+x ./01_setup_deb.sh
    echo "==========================="
    echo "1. Update your Linux distro"
    echo "==========================="
    ./01_setup_deb.sh
    rm ./01_setup_deb.sh
else
    echo "Distro setup script failed to download!"
fi

wget $1 https://raw.githubusercontent.com/willdiaz/wsl-setup/master/02_install_npm.sh
test -f ./02_install_npm.sh
if [ $? -eq 0 ]; then
    chmod u+x ./02_install_npm.sh
    echo "============================"
    echo "2. Install Node, NPM and NVM"
    echo "============================"
    ./02_install_npm.sh
    rm ./02_install_npm.sh
else
    echo "NPM install script failed to download!"
fi

wget $1 https://raw.githubusercontent.com/willdiaz/wsl-setup/master/03_install_angular_cli.sh
test -f ./03_install_angular_cli.sh
if [ $? -eq 0 ]; then
    chmod u+x ./03_install_angular_cli.sh
    echo "======================"
    echo "3. Install Angular CLI"
    echo "======================"
    ./03_install_angular_cli.sh
    rm ./03_install_angular_cli.sh
else
    echo "Angular CLI setup script failed to download!"
fi

wget $1 https://raw.githubusercontent.com/willdiaz/wsl-setup/master/04_install_php.sh
test -f ./04_install_php.sh
if [ $? -eq 0 ]; then
    chmod u+x ./04_install_php.sh
    echo "==========================="
    echo "4. Install PHP and Composer"
    echo "==========================="
    ./04_install_php.sh
    rm ./04_install_php.sh
else
    echo "PHP setup script failed to download!"
fi

wget $1 https://raw.githubusercontent.com/willdiaz/wsl-setup/master/05_install_mariadb.sh
test -f ./05_install_mariadb.sh
if [ $? -eq 0 ]; then
    chmod u+x ./05_install_mariadb.sh
    echo "=================="
    echo "4. Install MariaDB"
    echo "=================="
    ./05_install_mariadb.sh
    rm ./05_install_mariadb.sh
else
    echo "MariaDB setup script failed to download!"
fi

echo ""
echo "========================================================================"
echo "Now open a new terminal window to use the installed tools"
echo "Go to https://github.com/willdiaz/wsl-setup for help and troubleshooting"
echo "========================================================================"
