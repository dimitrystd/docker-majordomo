#!/bin/bash
# Docker doesn't have a great way to set runtime environment variables,
# so use this script to prepare the execution environnment for later processes.

# Update required keys for newrelic agent
if [ -f "/etc/php5/cli/conf.d/newrelic_majordomo.ini" ]; then
    sed "s/REPLACE_WITH_REAL_KEY/${NEWRELIC_KEY}/g" -i /etc/php5/cli/conf.d/newrelic_majordomo.ini
    sed "s/REPLACE_WITH_APP_NAME/${NEWRELIC_APP_NAME}/g" -i /etc/php5/cli/conf.d/newrelic_majordomo.ini
fi
sed "s/ServerName.*/ServerName ${VIRTUAL_HOST}/g" -i /etc/apache2/sites-available/000-default.conf

# Execute the commands passed to this script
exec "$@"
