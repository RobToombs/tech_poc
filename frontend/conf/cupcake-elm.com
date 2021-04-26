server {
    listen 80;
    listen [::]:80;

    root /var/www/cupcake-elm.com/html;
    index index.html;

    server_name cupcake-elm.com www.cupcake-elm.com;

    #location /api {
    #  proxy_pass http://localhost:8080;
    #}
    location / {
        try_files $uri $uri/ =404;
    }
}
