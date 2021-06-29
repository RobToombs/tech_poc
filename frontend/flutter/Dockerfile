FROM nginx:latest

# Copy built Flutter site over
COPY ./build/web/index.html /usr/share/nginx/html
COPY ./build/web/flutter_service_worker.js /usr/share/nginx/html
COPY ./build/web/main.dart.js /usr/share/nginx/html
COPY ./build/web/manifest.json /usr/share/nginx/html
COPY ./build/web/version.json /usr/share/nginx/html
COPY ./build/web/assets/AssetManifest.json /usr/share/nginx/html/assets
COPY ./build/web/assets/FontManifest.json /usr/share/nginx/html/assets
COPY ./build/web/assets/fonts/* /usr/share/nginx/html/assets
COPY ./build/web/icons/* /usr/share/nginx/html/icons

# Copy flutter frontend configuration over
COPY nginx.conf /etc/nginx/nginx.conf
