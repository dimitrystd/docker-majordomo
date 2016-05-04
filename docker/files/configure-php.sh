#!/bin/bash
# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
{ \
echo 'opcache.memory_consumption=128'; \
echo 'opcache.interned_strings_buffer=8'; \
echo 'opcache.max_accelerated_files=4000'; \
echo 'opcache.revalidate_freq=60'; \
echo 'opcache.fast_shutdown=1'; \
echo 'opcache.enable_cli=1'; \
} > /etc/php5/cli/conf.d/opcache-recommended.ini

# enable php logging
{ \
echo 'error_log=/var/log/php/php_error.log'; \
echo 'log_errors=true'; \
echo 'log_errors_max_len=0'; \
echo 'error_reporting=E_ALL & ~E_NOTICE'; \
echo 'display_errors=stdout'; \
echo 'display_startup_errors=true'; \
} > /etc/php5/cli/conf.d/logging.ini

mkdir -p /var/log/php
touch /var/log/php/php_error.log
chown www-data: /var/log/php/php_error.log
chmod +rw /var/log/php/php_error.log

# majordomo recommended settings
{ \
echo 'max_execution_time=90'; \
echo 'max_input_time=100'; \
echo 'post_max_size=200M'; \
echo 'upload_max_filesize=50M'; \
echo 'max_file_uploads=150'; \
echo 'date.timezone=Europe/Kiev'; \
} > /etc/php5/cli/conf.d/majordomo.ini

ln -s /etc/php5/cli/conf.d/opcache-recommended.ini /etc/php5/apache2/conf.d/opcache-recommended.ini
ln -s /etc/php5/cli/conf.d/logging.ini /etc/php5/apache2/conf.d/logging.ini
ln -s /etc/php5/cli/conf.d/majordomo.ini /etc/php5/apache2/conf.d/majordomo.ini
