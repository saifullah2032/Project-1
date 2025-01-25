# Use the official PHP image with Apache
FROM php:8.1-apache

# Copy the application files into the Apache server's document root
COPY . /var/www/html/

# Enable Apache mod_rewrite (common for PHP apps)
RUN a2enmod rewrite

# Expose port 80
EXPOSE 80

# Start Apache in the foreground (this is the default behavior)
CMD ["apache2-foreground"]
