#!/usr/bin/env bash

# https://linuxize.com/post/how-to-install-mariadb-on-ubuntu-18-04/
sudo apt install -y mariadb-server

# start the mysql service
sudo service mysql start

# https://askubuntu.com/questions/766334/cant-login-as-mysql-user-root-from-normal-user-account-in-ubuntu-16-04
# create permission correction SQL statement
wget https://raw.githubusercontent.com/willdiaz/wsl-setup/master/05_reset_root.sql
test -f ./05_reset_root.sql
if [ $? -eq 0 ]; then
  # run SQL on database, then remove statement
  sudo mysql < root_reset.sql
  rm ./05_reset_root.sql
else
  echo "Root user reset script failed to download!"
fi 
