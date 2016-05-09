# Usage

* Create two folders. Data from docker container will be saved there
```
mkdir -p /var/log/majordomo/debmes
mkdir -p /var/majordomo/backup
```
* Edit `docker-compose.yml` and `common-services.yml`, set actual credentials and IP
 * Configuration expects that you have [Amazon AWS](http://aws.amazon.com/), [newrelic](http://newrelic.com/) and [sumo logic](https://www.sumologic.com/) accounts. You can remove appropriate services if from configuration if you don't want to use them
* Run services
```
docker-compose up -d
```
* Now you can check how website and cycles work
```
tail -f /var/majordomo/debmes/*
```
Also you can look at list of services
```
docker-compose ps
```
it will look like
```
Name                         Command               State         Ports
----------------------------------------------------------------------------------------
majordomo_config_backup_1    /bin/sh -c /sbin/entrypoint.sh   Up
majordomo_cycles_1           /entrypoint.sh php cycle.php     Up      80/tcp
majordomo_majordomo_logs_1   /bin/bash run.sh xxxxxxx ...     Up
majordomo_mysql_backup_1     sh run.sh                        Up
majordomo_mysql_logs_1       /bin/bash run.sh xxxxxxx ...     Up
majordomo_web_1              /entrypoint.sh /start.sh         Up      0.0.0.0:80->80/tcp
```

Also you can use `bash majordomo-start.sh` for simple services start with purging obsolete containers.
