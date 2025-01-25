# Use the official PHP image with Apache
FROM php:8.1-apache

# Install required PHP extensions
RUN docker-php-ext-install mysqli

# Copy the code into the container
COPY . /var/www/html/

# Set the working directory
WORKDIR /var/www/html/

# Expose port 80 to the outside world
EXPOSE 80

# Start the Apache server (with PHP) on port 80
CMD ["apache2-foreground"]
