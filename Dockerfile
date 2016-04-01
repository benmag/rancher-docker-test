FROM richarvey/nginx-php-fpm

# Install some dependencies
RUN apt-get update && \
	apt-get install curl nano && \
	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add new nginx config
COPY conf/nginx-site.conf /etc/nginx/sites-available/default.conf

# Copy app source into tmp folder
COPY app/ /app

# Install app dependencies
RUN cd /app && \
	composer create-project && \
	composer install --no-interaction # --no-dev -vvv --prefer-source 

RUN chmod -R 777 /app/storage && \
	chmod -R 777 /app/bootstrap/cache
	
EXPOSE 80
