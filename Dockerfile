# Use the official PHP image
FROM php:8.1-fpm

# Install nginx and php-fpm
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get install -y php-fpm

# Copy application files to the container
COPY . /var/www/html/

# Copy Nginx configuration
COPY ./nginx/default.conf /etc/nginx/sites-available/default

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Nginx and PHP-FPM in the foreground
CMD service nginx start && php-fpm -F
