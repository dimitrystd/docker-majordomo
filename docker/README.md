# Available settings

Env variable | Default | Description
-|-|-
`VIRTUAL_HOST` | majordomo | Will be used as `ServerName` in `/etc/apache2/sites-available/000-default.conf` and by scheduled jobs (when generating URL to web server). Also it can be used by [jwilder/nginx-proxy](https://hub.docker.com/r/jwilder/nginx-proxy/)
`DB_HOST` | | MySQL host
`DB_NAME` | db_terminal | MySQL database name
`DB_USER` | | MySQL user name
`DB_PASSWORD` | | MySQL user password
`MAIL_USER` | | Email for notification
`EMAIL_PASSWORD` | | Email password
`EXT_ACCESS_USERNAME` | | External authentication user
`EXT_ACCESS_PASSWORD` | | External authentication password
`NEWRELIC_APP_NAME` | Majordomo | Application name in [new relic dashboard](https://rpm.newrelic.com)
`NEWRELIC_KEY` | | New Relic license key which you can find in dashboard

# Usage CLI

## Build image
Below command uses the customized version of majordomo from https://github.com/dimitrystd/majordomo.git
```
docker build --rm --no-cache --tag=dmitriy/majordomo:latest -f ./docker/Dockerfile ./docker
```
If you want to build image with the original majordomo version, then use
```
docker build --rm --no-cache --tag=dmitriy/majordomo:original --build-arg MAJORDOMO_SOURCE=https://github.com/sergejey/majordomo.git -f ./docker/Dockerfile ./docker
```

## Run as container
* Run web site
```
docker run -it --rm -p 80:80 -e VIRTUAL_HOST=<physical_server_domain\ip> -e DB_HOST=<mysql_server_ip> -e DB_NAME=<db_name> -e DB_USER=<db_user> -e DB_PASSWORD=<db_pwd> -e MAIL_USER=xxx@gmail.com -e EMAIL_PASSWORD=<email_pwd> -e NEWRELIC_APP_NAME=Majordomo-web -e NEWRELIC_KEY=<newrelic_key> dmitriy/majordomo
```
* Run cycles
```
docker run -it --rm -e VIRTUAL_HOST=<physical_server_domain\ip> -e DB_HOST=<mysql_server_ip> -e DB_NAME=<db_name> -e DB_USER=<db_user> -e DB_PASSWORD=<db_pwd> -e MAIL_USER=xxx@gmail.com -e EMAIL_PASSWORD=<email_pwd> -e NEWRELIC_APP_NAME=Majordomo-bgtasks -e NEWRELIC_KEY=<newrelic_key> dmitriy/majordomo
```

You can map folders from container by adding to command line
```
-v var/log/majordomo/debmes:/var/www/debmes -v /var/majordomo/backup:/var/www/backup
```
