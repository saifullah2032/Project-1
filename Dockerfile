# Use the official PHP image with Apache
FROM php:8.1-apache

# Install any dependencies (like GD for image handling)
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && a2enmod rewrite

# Copy the application files into the Apache server's document root
COPY . /var/www/html/

# Expose port 80 for web traffic
EXPOSE 80

# Command to run Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
