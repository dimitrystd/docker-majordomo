Create mysql user and empty database.
```
mysql -u root -p
CREATE USER 'majordomo_sql'@'%' IDENTIFIED BY 'password';
CREATE DATABASE `majordomo` CHARACTER SET utf8;
GRANT ALL ON majordomo.* TO 'majordomo_sql'@'%';
FLUSH PRIVILEGES;
SHOW DATABASES;
exit
```
Restore database from backup
```
mysql -u majordomo_sql -p majordomo < /srv/tmp/db_terminal_backup.sql
```
