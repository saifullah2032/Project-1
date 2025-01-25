# Use an image with both PHP and Apache (from official PHP Docker images)
FROM php:8.1-apache

# Install Apache and PHP extensions if required
RUN apt-get update && apt-get install -y \
    apache2 \
    libapache2-mod-php \
    && apt-get clean

# Copy your website files to the container
COPY . /var/www/html/

# Enable Apache mod_rewrite for clean URLs (if needed for your project)
RUN a2enmod rewrite

# Expose the default Apache port
EXPOSE 80

# Set the start command to ensure Apache runs in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
