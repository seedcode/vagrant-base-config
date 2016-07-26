#!/usr/bin/env bash

##-- Run as root --##

echo "Updating package repo..."
apt-get update

echo "Installing web server software..."
# Install nginx
apt-get install -qy nginx php5 php5-fpm php5-gd php5-cgi php5-cli php5-curl

# Install PHP and dependencies
apt-get install -qy php5 php5-fpm php5-gd php5-cgi php5-cli php5-curl

# Install dependencies and other dev libraries
apt-get install -qy build-essential curl git libssl-dev ruby1.9.3

echo "Installing CloudFoundry CLI"
# Install CloudFoundary CLI
curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -zx
mv cf /usr/local/bin

echo "Installing let's encrypt ssl library..."
#Install let's encrypt so we can use free ssl: https://letsencrypt.readthedocs.org/en/latest/
git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt

echo "Moving nginx config files into place…"
rm /etc/nginx/sites-enabled/default
cp /vagrant/vagrant/nginx/default.conf /etc/nginx/sites-enabled/
cp /vagrant/vagrant/nginx/dummy.* /etc/nginx/

echo "Moving php config files into place…"
mv /etc/php5/fpm/php.ini /etc/php5/fpm/php.ini.default
cp /vagrant/vagrant/php/php.ini /etc/php5/fpm/php.ini

echo "Starting services…"
service nginx restart
service php5-fpm restart
