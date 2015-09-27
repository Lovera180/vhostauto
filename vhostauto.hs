#!/bin/sh
echo "Criando virtual host para o site "$1
 
echo "<VirtualHost *:80>
    ServerName $1
    ServerAdmin admin@admin.com.br
    DocumentRoot /var/www/$1/public
    ErrorLog /var/log/apache2/error.log
    CustomLog /var/log/apache2/access.log combined
 
    <Directory '/var/www/$1/'>
        Options Includes FollowSymLinks
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>
</VirtualHost>" > /etc/apache2/sites-available/$1.conf
 
echo "Ativando o site "$1" em /etc/apache2/sites-available"
 
cd /etc/apache2/sites-available
 
a2ensite $1
 
echo "Reiniciando apache..."
 
service apache2 restart
 
echo "Adicionando o direcionamento do domínio em /etc/hosts..."
 
echo "127.0.0.1 "$1 >> /etc/hosts
 
echo "Baixando o projeto do laravel /var/www/"$1
 
cd /var/www
 
composer create-project laravel/laravel --prefer-dist $1
 
echo "Concedendo permissões"
 
# altere o user para o nome do seu usuário
chown -R www-data:user $1
chmod -R 777 $1
 
cd $1
 
echo "Tudo ok... Vamos lá!!!"
exit
