# sleep 10

# mkdir -p /run/php/
# touch /run/php/php7.3-fpm.pid
# chown -R www-data:www-data /var/www/*
# chmod -R 755 /var/www/*

# if [! -f /var/www/html/wp-config.php]; then
#   wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#   chmod +x wp-cli.phar
#   mv wp-cli.phar /usr/local/bin/wp
#   cd /var/www/html/
#   wp core download --allow-root
#   mv ./wp-config.php /var/www/html/
#   echo "Configuring Wordpress parameters"
#   wp congig create --allow-root	--dbname=${DB_NAME} \
#   	                            --dbuser=${DB_USER} \
#                                 --dbpass=${DB_PASS} \
#                                 --dbhost=${DB_HOST} \
#                                 --dbprefix=${DB_PREFIX}
#   wp core install --allow-root	--url=localhost/wordpress \
#                                 --title=${WP_TITLE} \
#                                 --admin_user=${WP_ADMIN_USER} \
#                                 --admin_password=${WP_ADMIN_PASSWORD} \
#                                 --admin_email=${WP_MAIL}
# fi                              
# exec "$@"


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/html/wordpress
sleep 10
if [ ! -e /var/www/html/wordpress/wp-config.php ]; then
    wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --dbprefix=smt
    echo "create finish"
    wp core install --allow-root --url=$DB_URL --title=smt --admin_user=$DB_USER --admin_password=$DB_PASSWORD--admin_email=$WP_MAIL
    echo "core install finish"
    # wp user create --allow-root $USER_NAME $USER_MAIL --role=author --user_pass=$USER_PASS
    # echo "user create finish"

    chmod 666 /var/www/html/wordpress/wp-config.php

    sed -i '67d/67r "define( 'WP_DEBUG', false );"' /var/www/html/wordpress/wp-config.php

    chmod 644 /var/www/html/wordpress/wp-config.php
fi


###################
#   Options       #
###################
#
#--url=<url>
#--title=<site-title>
#--admin_user=<username>
#[--admin_password=<password>]
#--admin_email=<email>
#[--skip-email]


#########################
#   GLOBAL PARAMETERS   #
#########################
#
#--path=<path>
#--url=<url>
#--ssh=[<scheme>:][<user>@]<host\|container>[:<port>][<path>]
#--http=<http>
#--user=<id\|login\|email>
#--skip-plugins[=<plugins>]
#--skip-themes[=<themes>]
#--skip-packages
#--require=<path>
#--exec=<php-code>
#--context=<context>
#--[no-]color
#--debug[=<group>]
#--prompt[=<assoc>]
#--quiet