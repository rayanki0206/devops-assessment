FROM php:8.1-apache

# Enable Apache rewrite module
RUN a2enmod rewrite

# Install dependencies needed for composer and PHP extensions
RUN apt-get update && apt-get install -y unzip git

# Install PHP extensions needed
RUN docker-php-ext-install pdo pdo_mysql

# Install composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy application code to web root
COPY . /var/www/html/

# Set working directory
WORKDIR /var/www/html

# Run composer install to get dependencies
RUN composer install --no-dev --optimize-autoloader

# Set ownership so Apache can read/write as needed
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
