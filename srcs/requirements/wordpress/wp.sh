sleep 10


if [! -f /var/www/html/wp-config.php]; then
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar #почему мы находимся в этой дериктории?
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/html
wp core download --allow-root #создаем wp на нашем сервере?
wp congig create --allow-root	--dbname=${DB_NAME} \
								--dbuser=${DB_USER} \
								--dbpass=${DB_PASS} \
								--dbhost=${DB_HOST} \
								--dbprefix=${DB_PREFIX}
wp core install --allow-root	--url=localhost/wordpress \
								--title=${WP_TITLE} \
								--admin_user=${WP_ADMIN_USER} \
								--admin_password=${WP_ADMIN_PASSWORD} \
								--admin_email=${WP_MAIL}
fi
exec "$@"


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