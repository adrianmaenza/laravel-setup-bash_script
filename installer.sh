#!/bin/bash
# This script installs laravel in the folder it is executed in whether its empty or 
# not
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php composer.phar create-project --prefer-dist laravel/laravel blog

if [ -d public_html ]; then
  rm -rf public_html
fi

cp -r blog/* . # copy all the contents of the blog folder to current dir
rm -rf blog # delete the blog folder
mv public public_html # rename public_html to public