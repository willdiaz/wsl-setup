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
        wget https://raw.githubusercontent.com/willdiaz/wsl-setup/master/00_setup_wsl.sh
    ```

1. Run the command:

    ```
        ./00_setup_wsl.sh
    ```

1. Follow the prompts.

## Future Updates

I plan on adding MariaDB server and client next. When I get a full set of tools and aliases in place, I'd like to explore creating a [Docker Container](https://www.docker.com/resources/what-container) with this configuration.

## CHANGELOG

+ **2018-11-28:** The *00_setup_wsl.sh* script handles downloading all of the scripts now, making it simple to download and run it. I'm debating whether or not this really needs to be a series of scripts. I should consider consolidating them into a single script.