FROM nginx:latest

# Copy built Flutter site over
COPY ./flutter/build/web/index.html /var/www/cupcake-flutter.com/html/
COPY ./flutter/build/web/flutter_service_worker.js /var/www/cupcake-flutter.com/html/
COPY ./flutter/build/web/main.dart.js /var/www/cupcake-flutter.com/html/
COPY ./flutter/build/web/manifest.json /var/www/cupcake-flutter.com/html/
COPY ./flutter/build/web/version.json /var/www/cupcake-flutter.com/html/
COPY ./flutter/build/web/assets/AssetManifest.json /var/www/cupcake-flutter.com/html/assets/
COPY ./flutter/build/web/assets/FontManifest.json /var/www/cupcake-flutter.com/html/assets/
COPY ./flutter/build/web/assets/fonts/* /var/www/cupcake-flutter.com/html/assets/fonts/
COPY ./flutter/build/web/icons/* /var/www/cupcake-flutter.com/html/icons/

# Copy built Elm Site over
COPY ./elm/build/web/* /var/www/cupcake-elm.com/html/

# Change site owner to www-data
RUN chown www-data:www-data /var/www/cupcake-flutter.com
RUN chown www-data:www-data /var/www/cupcake-elm.com

# Copy our nginx server block configurations over
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/cupcake-flutter.com /etc/nginx/sites-enabled/cupcake-flutter.conf
COPY conf/cupcake-elm.com /etc/nginx/sites-enabled/cupcake-elm.conf