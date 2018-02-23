FROM php:7.2-cli-stretch

MAINTAINER Gildásio Júnior (gildasiojunior@infojr.com.br)

# ENV APACHE_DOCUMENT_ROOT /path/to/new/root

# update package list
RUN apt-get update

# install curl and git
RUN apt-get install -y curl git

# install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# install pdo
RUN docker-php-ext-install pdo pdo_mysql

EXPOSE 8000

WORKDIR /var/www/html/

CMD ["php", "artisan", "serve", "--host", "0.0.0.0"]