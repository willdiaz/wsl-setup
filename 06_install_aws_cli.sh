#!/usr/bin/env bash

# Python is installed earlier, so install Pip
sudo apt install python3-pip

# Install the AWS CLI
pip3 install awscli --upgrade

# Create a .bash_login file in order to add aws-cli to the PATH
test -f ~/.bash_login
if [ $? -eq 1  ]; then
    touch ~/.bash_login
    echo 'PATH="~/.local/bin:$PATH"' > ~/.bash_login
else
    echo "Please add aws to your PATH variable"
fi
