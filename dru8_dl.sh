#!/bin/bash
druVersion=8.1.4
cd $HOME 
curl -O https://ftp.drupal.org/files/projects/drupal-$druVersion.tar.gz 
tar xvf drupal-$druVersion.tar.gz 
mv drupal-$druVersion workspace/ 
#mv drupal-$druVersion/.htaccess workspace/