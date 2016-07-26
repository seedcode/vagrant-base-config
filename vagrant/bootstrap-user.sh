#!/usr/bin/env bash

##-- Run as user --##

#Install NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash
echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.profile
source /home/vagrant/.profile
nvm install stable
nvm alias default stable

# Install grunt command line tool - http://gruntjs.com
npm install -g grunt-cli

# Install browser-sync - https://www.browsersync.io
npm install -g browser-sync

# Install mocha unit test framework - ttps://mochajs.org
npm install -g mocha

# Install chai assertian library for testing in mocha - http://chaijs.com
npm install -g chai

# Install nodemon - https://github.com/remy/nodemon
npm install -g nodemon
