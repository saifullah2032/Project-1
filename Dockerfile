# Use the official PHP image with FPM
FROM php:8.1-fpm

# Install necessary packages (nginx and dependencies)
RUN apt-get update && apt-get install -y \
    nginx \
    curl \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Copy the website's code to the container
COPY . /var/www/html/

# Copy nginx configuration file
COPY ./nginx/default.conf /etc/nginx/sites-available/default

# Expose port 80 for the application
EXPOSE 80

# Start nginx and PHP-FPM (this starts PHP-FPM in the background and Nginx in the foreground)
CMD service nginx start && php-fpm -F
