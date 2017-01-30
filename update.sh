#!/bin/bash

# Update Magento 2 instance project script
# Author  : Antoine Subit - antoine@subit.fr 
# Licence : GNU GPL v3

# Colors for adding some fun here...
NC='\033[0m' # No Color
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

# Clear console
clear

# Start message
echo "${LIGHTRED}╔═════════════════════════════════════╗${NC}"
echo "${LIGHTRED}║${NC}   ${YELLOW}Update Magento instance project${NC}   ${LIGHTRED}║${NC}"
echo "${LIGHTRED}╚═════════════════════════════════════╝${NC}"

# Go on project directory
echo "${GREEN}Go on project directory${NC}"
cd /var/www/project-name # Enter here the absolute Magento instance directory path
pwd

# Manage Git branches (Uncomment following lines for manage your own specific Git process)
#echo "${GREEN}Fetch Git branches...${NC}"
#git fetch
# Checkout on Git branch develop
#echo "${GREEN}Checkout on Git branch develop...${NC}"
#git checkout develop
# Pull Git branch develop
#echo "${GREEN}Pull Git branch develop...${NC}"
#git pull origin develop

# Upgrade Magento project
echo "${GREEN}Upgrade Magento project...${NC}"
php bin/magento setup:upgrade

# Remove Magento static content (Replace ProjectName by your own frontend project name folder)
echo "${GREEN}Remove Magento static content...${NC}"
echo "${YELLOW}rm -rf var/view_preprocessed/*${NC}"
rm -rf var/view_preprocessed/*
echo "${YELLOW}rm -rf pub/static/frontend/ProjectName/default/en_US/css/*${NC}"
rm -rf pub/static/frontend/ProjectName/default/en_US/css/*
echo "${YELLOW}rm -rf pub/static/frontend/ProjectName/default/en_US/js/*${NC}"
rm -rf pub/static/frontend/ProjectName/default/en_US/js/*
echo "${YELLOW}rm -rf var/di/* var/generation/*${NC}"
rm -rf var/di/* var/generation/*

# Deploy Magento static content for fr_FR
echo "${GREEN}Deploy Magento static content...${NC}"
echo "${YELLOW}php bin/magento setup:static-content:deploy en_US${NC}"
php bin/magento setup:static-content:deploy en_US
# add here other langage to deploy...
# for know all installed langage on this instance run "php bin/magento info:language:list"

# Compile Magento project
echo "${GREEN}Compile Magento project...${NC}"
php bin/magento setup:di:compile

# Flush cache
echo "${GREEN}Flush Magento cache...${NC}"
php bin/magento cache:flush

# Setting permissions
echo "${GREEN}Setting permissions...${NC}"
chmod -R 777 var/*
chown -R www-data:www-data var/*
chmod -R 777 pub/*
chown -R www-data:www-data pub/*

# Message refresh with clean web browser cache
echo "${GREEN}Please refresh the Magento instance in web browser with ${CYAN}Ctrl${NC} ${GREEN}+${NC} ${CYAN}F5${NC}"

# End
echo "${GREEN}End${NC}"
