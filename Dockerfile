FROM php:8.1-apache

# Enable Apache rewrite module
RUN a2enmod rewrite

# Install PHP extensions (adjust as needed)
RUN docker-php-ext-install pdo pdo_mysql

# Copy Yii2 app into web root
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
