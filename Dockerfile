# Use the official PHP image with Apache
FROM php:8.1-apache

# Install required PHP extensions (optional, if needed)
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# Copy your website files to the container
COPY . /var/www/html/

# Enable Apache mod_rewrite for clean URLs (if needed for your project)
RUN a2enmod rewrite

# Expose the default Apache port
EXPOSE 80

# Start Apache explicitly in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
