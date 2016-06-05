#!/bin/bash
curl https://download.newrelic.com/548C16BF.gpg | apt-key add -
echo "deb http://apt.newrelic.com/debian/ newrelic non-free" > /etc/apt/sources.list.d/newrelic.list
export NR_INSTALL_SILENT=true
apt-get update && apt-get install -y newrelic-php5
newrelic-install install
# Known issue https://discuss.newrelic.com/t/php-warning-module-newrelic-already-loaded-in-unknown-on-line-0/2903/19
rm /etc/php5/cli/conf.d/newrelic.ini /etc/php5/apache2/conf.d/newrelic.ini

apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
