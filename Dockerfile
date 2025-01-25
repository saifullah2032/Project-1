# Use the official PHP image with Apache
FROM php:8.1-apache

# Install any required dependencies
RUN apt-get update && apt-get install -y \
    curl \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Copy your website files to the container
COPY . /var/www/html/

# Expose the default Apache port
EXPOSE 80

# Enable mod_rewrite for clean URLs (if needed for your project)
RUN a2enmod rewrite

# Set the entrypoint to run Apache in the foreground
CMD ["apache2-foreground"]
