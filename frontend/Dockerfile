FROM debian:latest

# Add Light Http Server
RUN apk update && apk upgrade
RUN apk add --update lighttpd

# Copy our Http server config file over
COPY ./conf/* /etc/lighttpd/

# Copy built Flutter site over
COPY ./flutter/build/web/index.html /var/www/localhost/htdocs/cupcake.flutter/
COPY ./flutter/build/web/flutter_service_worker.js /var/www/localhost/htdocs/cupcake.flutter/
COPY ./flutter/build/web/main.dart.js /var/www/localhost/htdocs/cupcake.flutter/
COPY ./flutter/build/web/manifest.json /var/www/localhost/htdocs/cupcake.flutter/
COPY ./flutter/build/web/version.json /var/www/localhost/htdocs/cupcake.flutter/
COPY ./flutter/build/web/assets/AssetManifest.json /var/www/localhost/htdocs/cupcake.flutter/assets/
COPY ./flutter/build/web/assets/FontManifest.json /var/www/localhost/htdocs/cupcake.flutter/assets/
COPY ./flutter/build/web/assets/fonts/* /var/www/localhost/htdocs/cupcake.flutter/assets/fonts/
COPY ./flutter/build/web/icons/* /var/www/localhost/htdocs/cupcake.flutter/icons/

# Copy built Elm Site over
COPY ./elm/build/web/* /var/www/localhost/htdocs/cupcake.elm/

EXPOSE 80

CMD ["lighttpd","-D","-f","/etc/lighttpd/lighttpd.conf"]