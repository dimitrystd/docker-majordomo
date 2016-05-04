#!/bin/bash
curl https://download.newrelic.com/548C16BF.gpg | apt-key add -
echo "deb http://apt.newrelic.com/debian/ newrelic non-free" > /etc/apt/sources.list.d/newrelic.list
export NR_INSTALL_SILENT=true
apt-get update && apt-get install -y newrelic-php5
newrelic-install install
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
