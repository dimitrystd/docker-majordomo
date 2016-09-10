FROM php:5-alpine

MAINTAINER Dmytro Studynskyi "dimitrystd@gmail.com"

RUN mkdir -p /opt/megad \
  && curl http://ab-log.ru/files/File/megad-cfg/megad-cfg.zip > /opt/megad/megad-cfg.zip \
  && unzip /opt/megad/megad-cfg.zip -d /opt/megad \
  && rm /opt/megad/megad-cfg.zip

RUN docker-php-ext-install sockets

WORKDIR /opt/megad
CMD ["sh"]
