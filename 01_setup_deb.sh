#!/usr/bin/env bash

# UPDATE DEBIAN/UBUNTU
sudo apt update
sudo apt upgrade -y

# INSTALL CURL
# https://www.cyberciti.biz/faq/howto-install-curl-command-on-debian-linux-using-apt-get/
sudo apt install -y curl

# INSTALL UNZIP
sudo apt install -y unzip

# INSTALL SCREENFETCH
# https://www.lifewire.com/show-system-information-terminal-with-screenfetch-2201159
sudo apt install -y screenfetch
screenfetch

# INSTALL GIT
# https://git-scm.com/download/linux
sudo apt install -y git

#For Ubuntu, this PPA provides the latest stable upstream Git version
# add-apt-repository ppa:git-core/ppa # apt update; apt install git