#!/bin/bash
# Install Majordomo from github
apt-get update && apt-get install -y git
# Clone git repo
cd /tmp
echo "Install majordomo from git. URL=$MAJORDOMO_SOURCE"
git clone $MAJORDOMO_SOURCE
cp -rfp /tmp/majordomo/* /var/www/
cp -rfp /tmp/majordomo/.htaccess /var/www/
rm -rf /tmp/majordomo

# Uninstall git and purge
apt-get --purge autoremove -y git
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create required folders for running scripts
mkdir -p /var/www/cached/voice
mkdir -p /var/www/cached/urls
chown www-data:www-data -R /var/www
chmod +x /var/www/*.sh
