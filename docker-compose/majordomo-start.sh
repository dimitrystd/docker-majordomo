#!/bin/bash
/usr/local/bin/docker-compose -f /etc/majordomo/docker-compose.yml stop
/usr/local/bin/docker-compose -f /etc/majordomo/docker-compose.yml rm -f --all
/usr/local/bin/docker-compose -f /etc/majordomo/docker-compose.yml pull
/usr/local/bin/docker-compose -f /etc/majordomo/docker-compose.yml up -d
