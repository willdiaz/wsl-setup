#!/usr/bin/env bash

# WHICH DISTRO ARE WE RUNNING?
# https://www.cyberciti.biz/faq/find-linux-distribution-name-version-number/
# https://stackoverflow.com/questions/4651437/how-to-set-a-variable-to-the-output-of-a-command-in-bash
did="$(lsb_release -is)"
rel="$(lsb_release -rs)"

# ADD PPA FIRST IF RUNNING DEBIAN
# https://www.rosehosting.com/blog/how-to-install-php-7-2-on-debian-9/
if [ $did == "Debian" ]
then
    echo You are running $did $rel so we must install via PPA
    wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
    echo "deb https://packages.sury.org/php/ stretch main" | sudo tee /etc/apt/sources.list.d/php.list
    sudo apt update
fi

# INSTALL PHP
sudo apt install -y php7.2

# INSTALL COMMON PHP EXTENSIONS
sudo apt install -y php7.2-cli php7.2-common php7.2-opcache php7.2-curl php7.2-mbstring php7.2-mysql php7.2-zip php7.2-xml

# INSTALL COMPOSER
# https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md
EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
RESULT=$?
rm composer-setup.php
#exit $RESULT

# IF /USR/LOCAL/BIN EXITS, MOVE COMPOSER THERE
if [ -d "$HOME/.local/bin" ]
then
	mv ./composer.phar ~/.local/bin/composer
else
  echo "$HOME/.local/bin not found - composer.phar not moved"
fi
