FROM debian:jessie

MAINTAINER Dmytro Studynskyi "dimitrystd@gmail.com"

# Install the PHP extensions we need
RUN apt-get update && apt-get install -y \
  curl libcurl3 \
  php5 php5-cli php5-curl php-pear php5-xcache php5-mysql \
  # Install Apache for website
  apache2 apache2-utils libapache2-mod-php5 \
  # Install mysqldump for cycle.php
  mysql-client \
  ca-certificates --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Apache
ENV VIRTUAL_HOST majordomo

RUN rm -f /etc/apache2/sites-available/000-default.conf
COPY ./files/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN sed "s/ServerName.*/ServerName ${VIRTUAL_HOST}/g" -i /etc/apache2/sites-available/000-default.conf
RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf
RUN a2ensite 000-default \
  && a2enmod rewrite

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
      echo 'opcache.memory_consumption=128'; \
      echo 'opcache.interned_strings_buffer=8'; \
      echo 'opcache.max_accelerated_files=4000'; \
      echo 'opcache.revalidate_freq=60'; \
      echo 'opcache.fast_shutdown=1'; \
      echo 'opcache.enable_cli=1'; \
  } > /etc/php5/cli/conf.d/opcache-recommended.ini

# enable logging
RUN { \
      echo 'error_log=/var/log/php/error.log'; \
      echo 'log_errors=true'; \
      echo 'log_errors_max_len=0'; \
      echo 'error_reporting=E_ALL & ~E_NOTICE'; \
      echo 'display_errors=stdout'; \
      echo 'display_startup_errors=true'; \
  } > /etc/php5/cli/conf.d/logging.ini

RUN mkdir -p /var/log/php \
  && touch /var/log/php/error.log \
  && chown www-data: /var/log/php/error.log \
  && chmod +rw /var/log/php/error.log

# majordomo recommended settings
RUN { \
      echo 'max_execution_time=90'; \
      echo 'max_input_time=100'; \
      echo 'post_max_size=200M'; \
      echo 'upload_max_filesize=50M'; \
      echo 'max_file_uploads=150'; \
      echo 'date.timezone=Europe/Kiev'; \
  } > /etc/php5/cli/conf.d/majordomo.ini

RUN ln -s /etc/php5/cli/conf.d/opcache-recommended.ini /etc/php5/apache2/conf.d/opcache-recommended.ini \
  && ln -s /etc/php5/cli/conf.d/logging.ini /etc/php5/apache2/conf.d/logging.ini \
  && ln -s /etc/php5/cli/conf.d/majordomo.ini /etc/php5/apache2/conf.d/majordomo.ini

ARG MAJORDOMO_SOURCE=https://github.com/dimitrystd/majordomo.git

# Install Majordomo from github
RUN apt-get update && apt-get install -y git \
  # Clone git repo
  && cd /tmp \
  && echo "Install majordomo from git. URL=$MAJORDOMO_SOURCE" \
  && git clone $MAJORDOMO_SOURCE \
  && cp -rfp /tmp/majordomo/* /var/www/ \
  && cp -rfp /tmp/majordomo/.htaccess /var/www/ \
  && rm -rf /tmp/majordomo \
  # Uninstall and purge
  && apt-get --purge autoremove -y git \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./files/config.php /var/www/config.php
# Create required folders for running scripts
RUN mkdir -p /var/www/cached/voice \
  && mkdir -p /var/www/cached/urls
RUN chown www-data:www-data -R /var/www \
  && chmod +x /var/www/*.sh

COPY ./files/start.sh /start.sh
RUN chmod +x /start.sh

VOLUME ["/var/www/debmes", "/var/www/backup"]
WORKDIR /var/www
EXPOSE 80
CMD ["/start.sh"]
