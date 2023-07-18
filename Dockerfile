# Dockerfile
FROM php:8.2-cli

RUN apt-get update && \
    apt-get install -y git zip unzip && \
    docker-php-ext-install pdo_mysql

WORKDIR /var/www/html

COPY . /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install


#ENV APP_ENV=local
EXPOSE 8081

CMD php artisan serve --host=0.0.0.0 --port=8081

