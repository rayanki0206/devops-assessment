FROM php:8.1-apache

# Enable Apache rewrite module (optional, can remove if you want)
RUN a2enmod rewrite

# Copy your simple index.php to the web root
COPY web/index.php /var/www/html/index.php

# Set permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80