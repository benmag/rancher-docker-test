FROM richarvey/nginx-php-fpm

# Install some dependencies
RUN apt-get update && \
	apt-get install curl nano && \
	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add updated nginx config
COPY conf/nginx-site.conf /etc/nginx/sites-available/default.conf

# Bundle app source
COPY app/ /app

# Install app dependencies
RUN cd /app && \
	composer create-project && \
	composer install --no-interaction && \
	php artisan migrate --force

# Set required permissions
RUN chmod -R 777 /app/storage && \
	chmod -R 777 /app/bootstrap/cache


EXPOSE 80
