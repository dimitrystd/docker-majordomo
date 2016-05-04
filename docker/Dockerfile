FROM debian:jessie

MAINTAINER Dmytro Studynskyi "dimitrystd@gmail.com"

RUN apt-get update && apt-get install -y \
  curl libcurl3 \
  # Install the PHP and extensions
  php5 php5-cli php5-curl php-pear php5-xcache php5-mysql \
  # Install Apache for website
  apache2 apache2-utils libapache2-mod-php5 \
  # Install mysqldump for cycle.php
  mysql-client \
  ca-certificates --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configure Apache
RUN rm -f /etc/apache2/sites-available/000-default.conf
COPY ./files/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf
RUN a2ensite 000-default \
  && a2enmod rewrite

# Configure PHP
COPY ./files/configure-php.sh /configure-php.sh
RUN /configure-php.sh

ARG MAJORDOMO_SOURCE=https://github.com/dimitrystd/majordomo.git

# Install Majordomo from github
COPY ./files/install-majordomo.sh /install-majordomo.sh
RUN /install-majordomo.sh
COPY ./files/config.php /var/www/config.php

RUN rm -f /configure-php.sh /install-majordomo.sh

COPY ./files/start.sh /start.sh
RUN chmod +x /start.sh

# Install and configure newrelic agent
# Remove following lines if you don't want to use newrelic
ENV NEWRELIC_APP_NAME Majordomo
COPY ./files/newrelic.ini /etc/php5/cli/conf.d/newrelic_majordomo.ini
RUN ln -s /etc/php5/cli/conf.d/newrelic_majordomo.ini /etc/php5/apache2/conf.d/newrelic_majordomo.ini
COPY ./files/install-newrelic.sh /install-newrelic.sh
ARG DEBIAN_FRONTEND=noninteractive
RUN /install-newrelic.sh \
  && rm -f /install-newrelic.sh
# ==========

ENV VIRTUAL_HOST majordomo
ENV DB_NAME db_terminal
VOLUME ["/var/log", "/var/www/debmes", "/var/www/backup"]
WORKDIR /var/www
EXPOSE 80
CMD ["/start.sh"]
