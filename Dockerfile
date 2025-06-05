FROM php:8.1-apache

# Enable Apache rewrite module
RUN a2enmod rewrite

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Remove default files
RUN rm -rf /var/www/html/*

# Copy Yii2 app
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Change Apache DocumentRoot to /var/www/html/web
RUN sed -ri 's!DocumentRoot /var/www/html!DocumentRoot /var/www/html/web!' /etc/apache2/sites-available/000-default.conf

# Allow .htaccess overrides for /var/www/html/web
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

EXPOSE 80
