echo ‘nameserver 192.168.122.1’ > /etc/resolv.conf
apt-get update
apt-get install nginx -y

## Sein ##
echo ‘<h1>Sein</h1>’ > /var/www/html/index.nginx-debian.html

## Stark ##
echo ‘<h1>Stark</h1>’ > /var/www/html/index.nginx-debian.html

echo 'server{
	listen 80 default_server;
	listen [::]:80 default_server;
	listen 443;

	root /var/www/html;

	index index.html index.htm index.nginx-debian.html;

	server_name _;

	location / {
		try_files $uri $uri/ =404;
	}

}' > /etc/nginx/sites-available/default

service nginx restart