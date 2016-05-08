#!/bin/bash

/usr/sbin/apachectl start
tail -f /var/log/apache2/error.log /var/log/php/* /var/www/debmes/*
