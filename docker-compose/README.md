# Usage

* Create two folders. Data from docker container will be saved there
```
mkdir -p /var/majordomo/debmes
mkdir -p /var/majordomo/backup
```
* Edit `docker-compose.yml` and `common-services.yml`, set actual credentials and IP
* Run services
```
docker-compose up -d
```
* Now you can check how website and cycles work
```
tail -f /var/majordomo/debmes/*
```

Also you can use `bash majordomo-start.sh` for simple services start with purging obsolete containers.
