# WSL Setup

I use Windows Subsystem for Linux (WSL) for web development. It can be a chore to install the same applications whenever I set up a new Linux environment, so these scripts are meant to alleviate that work.

Running these scripts will install web development tools that I use:

1. Node.js (8, 10 or 11), NPM and NVM
1. Angular CLI
1. PHP and Composer
1. Python 3 and Pip
1. SASS
1. Git
1. MariaDB
1. AWS CLI
1. Linux command line tools cURL, screenfetch, unzip
1. *bash_aliases* file

## Requirements

These scripts are meant to be run with the one of the following Linux apps in the Microsoft Store on a Windows 10 PC:

1. [Ubuntu 18.04](https://www.microsoft.com/store/productId/9N9TNGVNDL3Q)
1. [Debian GNU/Linux](https://www.microsoft.com/store/productId/9MSVKQC78PK6)

## Usage

The below instructions assume that you just installed one of the above Linux apps and haven't installed Git or cURL yet.

**Important note:** The *--no-check-certificate* flag is only needed if you get a *ERROR: The certificate of ‘raw.githubusercontent.com’ is not trusted.* when trying to download the script, which I only encountered on Debian. Ubuntu does not need that flag to be set.

1. Run the following commands to download the scripts:
  ```
  wget --no-check-certificate https://raw.githubusercontent.com/willdiaz/wsl-setup/master/00_setup_wsl.sh
  ```
2. Allow the script to be executed:
  ```
  chmod u+x 00_setup_wsl.sh
  ```
3. Run the command:
  ```
  ./00_setup_wsl.sh --no-check-certificate
  ```
4. Follow the prompts.

## Just installed, now what?

1. To be sure that NVM installed, the following command should return 'nvm':
  ```
  command -v nvm
  ```
2. If Composer doesn't work, move it to the local bin folder and open a new terminal window.
  ```
  sudo mv ~/composer.phar ~/.local/bin/composer
  ```
3. If you plan on using AWS CLI, be sure to configure it:
  ```
  aws configure
  ```

## Future Updates

When I get a full set of tools and aliases in place, I'd like to explore creating a [Docker Container](https://www.docker.com/resources/what-container) with this configuration.

## CHANGELOG
+ **2019-04-06:** I added AWS CLI to the install routine. I spent most of my time testing against Debian, so I now have to spend more time on Ubuntu 18.04. I'll try the other distros at some point in the future.
+ **2019-04-06:** I added MariaDB to the install routine. I don't remember running into SSL-related issues when using *wget* from GitHub, but now the script lets you bypass the error with a *no-check-certificate* flag.
+ **2018-11-28:** The *00_setup_wsl.sh* script handles downloading all of the scripts now, making it simple to download and run it. I'm debating whether or not this really needs to be a series of scripts. I should consider consolidating them into a single script.
