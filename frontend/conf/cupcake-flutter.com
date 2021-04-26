server {
    listen 80 default_server;
    listen [::]:80 default_server ipv6only=on;

    root /var/www/cupcake-flutter.com/html;
    index index.html;

    server_name cupcake-flutter.com www.cupcake-flutter.com;

    #location /api {
    #  proxy_pass http://localhost:8080;
    #}
    location / {
        try_files $uri $uri/ =404;
    }
}