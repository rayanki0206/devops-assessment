FROM php:8.1-apache

# Enable Apache rewrite module for Yii2 URLs
RUN a2enmod rewrite

# Install required PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Clean default web directory
RUN rm -rf /var/www/html/*

# Copy Yii2 app into Apache web root
COPY . /var/www/html/

# Set correct ownership and permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Allow .htaccess overrides by updating Apache config
RUN sed -i 's|<Directory /var/www/>|<Directory /var/www/html/>|' /etc/apache2/apache2.conf \
    && sed -i '/<Directory \/var\/www\/html\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Expose port 80 for Apache
EXPOSE 80