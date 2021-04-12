FROM alpine:latest

# Add Light Http Server
RUN apk update && apk upgrade
RUN apk add --update lighttpd

# Copy our Http server config file over, and our built html/js files
COPY ./conf/* /etc/lighttpd/
COPY ./flutter/build/web/index.html /var/www/flutter/
COPY ./flutter/build/web/flutter_service_worker.js /var/www/flutter/
COPY ./flutter/build/web/main.dart.js /var/www/flutter/
COPY ./flutter/build/web/manifest.json /var/www/flutter/
COPY ./flutter/build/web/version.json /var/www/flutter/
COPY ./flutter/build/web/assets/AssetManifest.json /var/www/flutter/assets/
COPY ./flutter/build/web/assets/FontManifest.json /var/www/flutter/assets/
COPY ./flutter/build/web/assets/fonts/* /var/www/flutter/assets/fonts/
COPY ./flutter/build/web/icons/* /var/www/flutter/icons/
COPY ./elm/build/web/* /var/www/elm/

EXPOSE 80

CMD ["lighttpd","-D","-f","/etc/lighttpd/lighttpd.conf"]