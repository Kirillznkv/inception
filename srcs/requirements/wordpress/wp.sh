sleep 10


if [! -f /var/www/html/wp-config.php]; then
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/html
wp core download --allow-root
wp core install --allow-root --url=${YOUR_URL} \ #/localhost/wordpress
		--title="Your Blog Title" \
		--admin_user="admin" --admin_password="your_password" --admin_email="your_email"
