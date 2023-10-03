FROM wordpress:latest

ENV DOCUMENT_ROOT /var/www/html

#Install nginx php-fpm php-pdo unzip curl
RUN apt-get update && apt-get -y install unzip curl apt-utils

#Los comandos que quieres que haga en orden de arriba a abajo
#Libreria necesaria para utilizar xml-rpc
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/
#Comando para instalar el xml-rpc
RUN pecl install channel://pecl.php.net/xmlrpc-1.0.0RC3 
#Comando para que se establezca el xmlrpc en php
RUN docker-php-ext-enable xmlrpc

#Change php.ini file
#/usr/local/etc/php/php.ini
#extension=xmlrpc.so

#WPCLI

#XDebug


#directorio de trabajo
WORKDIR /var/www/html
#puerto expuesto
EXPOSE 80
#Iniciar un servidor web php dentro del contenedor para poder acceder a el por medio del puerto 80
CMD ["php", "-S", "0.0.0.0:80"]
