# Use the official PHP image with FPM (FastCGI Process Manager)
FROM php:8.1-fpm

# Install dependencies for PHP and Nginx
RUN apt-get update && apt-get install -y nginx

# Copy the application files into the Nginx document root
COPY . /var/www/html/

# Copy the custom Nginx configuration
COPY ./nginx/default.conf /etc/nginx/sites-available/default

# Expose the necessary ports
EXPOSE 80

# Start Nginx and PHP-FPM together
CMD service nginx start && php-fpm
