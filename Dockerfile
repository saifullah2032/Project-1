# Use the official PHP image with Apache
FROM php:8.1-apache

# Install necessary PHP extensions (e.g., mysqli for MySQL)
RUN docker-php-ext-install mysqli

# Copy your project files into the Docker container
COPY . /var/www/html/

# Set the working directory
WORKDIR /var/www/html/

# Expose the default web port
EXPOSE 80

# Start the PHP built-in server
CMD ["php", "-S", "0.0.0.0:80", "-t", "."]
