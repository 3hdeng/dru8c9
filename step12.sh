#!/bin/bash

# Redirect stdout ( > ) into a named pipe ( >() ) running "tee"
exec > >(tee /tmp/installlog.txt)
# Without this, only stdout would be captured
exec 2>&1


# Install PHP7.0 & Redis
sudo apt-get update && \
 sudo apt-get install -qq php7.0-fpm php7.0-cli php7.0-common php7.0-json \
           php7.0-opcache php7.0-mysql php7.0-phpdbg \
           php7.0-mbstring php7.0-gd php7.0-imap php7.0-ldap php7.0-pgsql \
           php7.0-pspell php7.0-recode php7.0-tidy php7.0-dev \
           php7.0-intl php7.0-gd php7.0-curl php7.0-zip php7.0-xml
           
sudo apt-get install -qq redis-server

sudo apt-get purge -qq apache2 mysql-server mysql-client

