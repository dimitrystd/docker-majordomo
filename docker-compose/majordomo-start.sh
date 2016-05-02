#!/bin/bash
docker-compose -f /etc/majordomo/docker-compose.yml stop
docker-compose -f /etc/majordomo/docker-compose.yml rm -f --all
docker-compose -f /etc/majordomo/docker-compose.yml pull
docker-compose -f /etc/majordomo/docker-compose.yml up -d
