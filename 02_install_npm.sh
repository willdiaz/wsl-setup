#!/usr/bin/env bash

# STEP 0: GOT CURL?
# https://askubuntu.com/questions/29370/how-to-check-if-a-command-succeeded
type curl > /dev/null
if [ $? -ne 0 ]
then
    echo "cURL is not available; please install it."
    exit
fi

# STEP 1: ADD NODESOURCE FOR DEBIAN-BASED INSTALLS AND INSTALL NODE.JS
# https://github.com/nodesource/distributions/blob/master/README.md#debinstall

echo "Which version of Node.js do you want?"
s=1
while [ $s -ne 2 ]
do
    read -p 'Please type 8, 10 or 11: ' version
    if [ $version -ne 8 ] && [ $version -ne 10 ] && [ $version -ne 11 ]; then
        echo "Invalid selection"
    else
        s=2
    fi
done

curl -sL https://deb.nodesource.com/setup_$version.x | sudo -E bash -
sudo apt-get install -y nodejs

# STEP 2: UPDATE NPM TO LATEST
# https://www.npmjs.com/get-npm

sudo npm install npm@latest -g

# STEP 3: INSTALL NVM
# https://github.com/creationix/nvm#installation

sudo chown -R $USER:$(id -gn $USER) /home/$USER/.config
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
