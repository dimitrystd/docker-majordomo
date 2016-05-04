#!/bin/bash
sed "s/ServerName.*/ServerName ${VIRTUAL_HOST}/g" -i /etc/apache2/sites-available/000-default.conf

/usr/sbin/apachectl start
tail -f /var/log/apache2/error.log /var/log/php/error.log /var/www/debmes/*
