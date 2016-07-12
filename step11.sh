#!/bin/bash

# Redirect stdout ( > ) into a named pipe ( >() ) running "tee"
exec > >(tee /tmp/installlog.txt)
# Without this, only stdout would be captured
exec 2>&1

# Check if sources.list is a symlink and make a copy so `apt-get update` succeeds
if [ -f /etc/apt/sources.list ] && [ -L /etc/apt/sources.list ]; then
  sudo mv /etc/apt/sources.list /etc/apt/sources.list.old
  sudo cp /etc/apt/sources.list.old /etc/apt/sources.list
fi

# Update Composer
sudo /usr/bin/composer self-update

# Add PHP7.0 Repository
LC_ALL=C.UTF-8 sudo add-apt-repository ppa:ondrej/php -y
sudo apt-add-repository ppa:chris-lea/redis-server -y
sudo apt-get update

# Update Heroku Toolbelt
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

