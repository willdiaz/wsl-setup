# WSL Setup

I use Windows Subsystem for Linux (WSL) for web development. It can be a chore to install the same applications whenever I set up a new Linux environment, so these scripts are meant to alleviate that work.

Running these scripts will install web development tools that I use:

1. Node.js, NPM and NVM
1. Angular CLI
1. PHP and Composer
1. Git
1. Linux command line tools cURL, screenfetch, unzip
1. *bash_aliases* file

## Requirements

These scripts are meant to be run with the [Ubuntu 18.04](https://www.microsoft.com/store/productId/9N9TNGVNDL3Q) and the [Debian GNU/Linux](https://www.microsoft.com/store/productId/9MSVKQC78PK6) apps in the Microsoft Store on a Windows 10 PC.

## Use

Please note that the Linux apps from the Microsoft Store don't have many development tools installed by default, so the below instructions assume you haven't installed Git yet.

1. Install one of the above Linux apps.

1. Run the following commands to download the scripts:

    ```
        cd ~/
        wget https://raw.githubusercontent.com/willdiaz/wsl-setup/master/00_setup_wsl.sh
        wget https://raw.githubusercontent.com/willdiaz/wsl-setup/master/01_setup_deb.sh
        wget https://raw.githubusercontent.com/willdiaz/wsl-setup/master/02_install_npm.sh
        wget https://raw.githubusercontent.com/willdiaz/wsl-setup/master/03_install_angular_cli.sh
        wget https://raw.githubusercontent.com/willdiaz/wsl-setup/master/04_install_php.sh
    ```

1. Run the command:

    ```
        ./00_setup_wsl.sh
    ```

1. Follow the prompts.

## Future Updates

I plan on adding MariaDB server and client next. When I get a full set of tools and aliases in place, I'd like to explore creating a [Docker Container](https://www.docker.com/resources/what-container) with this configuration.

I also intend on condensing the above set of wget statements to a single one and let the script handle the gettings of files.