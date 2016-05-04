#!/bin/bash
# Update required keys for newrelic agent
if [ -f "/etc/php5/cli/conf.d/newrelic_majordomo.ini" ]; then
    sed "s/REPLACE_WITH_REAL_KEY/${NEWRELIC_KEY}/g" -i /etc/php5/cli/conf.d/newrelic_majordomo.ini
    sed "s/REPLACE_WITH_APP_NAME/${NEWRELIC_APP_NAME}/g" -i /etc/php5/cli/conf.d/newrelic_majordomo.ini
fi
sed "s/ServerName.*/ServerName ${VIRTUAL_HOST}/g" -i /etc/apache2/sites-available/000-default.conf

/usr/sbin/apachectl start
tail -f /var/log/apache2/error.log /var/log/php/* /var/www/debmes/*
