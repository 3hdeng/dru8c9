#!/bin/bash

# Redirect stdout ( > ) into a named pipe ( >() ) running "tee"
exec > >(tee /tmp/installlog.txt)
# Without this, only stdout would be captured
exec 2>&1



# Apache2
sudo service apache2 stop
# NGINX
sudo service nginx stop


# Set them up!

# NGINX:
# Listen port 80, change document root, setup indexes, configure PHP sock
# set up the try_url thing (Drupal is not Worpress)...
# Thankfully, I already modified this in the repo!
# sudo wget https://raw.githubusercontent.com/GabrielGil/c9-lemp/master/c9 --output-document=/etc/nginx/sites-available/c9
nginx_site_c9=/etc/nginx/sites-available/c9
sudo cp ~/workspace/nginx_c9.conf $nginx_site_c9
sudo chmod 755 $nginx_site_c9
sudo ln -s $nginx_site_c9 /etc/nginx/sites-enabled/c9


# PHP:
fpmconf=/etc/php/7.0/fpm/pool.d/www.conf
sudo sed -i 's/user = www-data/user = ubuntu/g' $fpmconf
sudo sed -i 's/group = www-data/group = ubuntu/g' $fpmconf
sudo sed -i 's/pm = dynamic/pm = ondemand/g' $fpmconf
# Reduce number of processes..

# Install helper
#sudo wget https://raw.githubusercontent.com/GabrielGil/c9-lemp/master/lemp --output-document=/usr/bin/lemp
sudo cp ~/workspace/lemp.sh /usr/bin/lemp
sudo chmod 755 /usr/bin/lemp