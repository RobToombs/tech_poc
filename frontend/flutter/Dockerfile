FROM nginx:latest

# Copy built Flutter site over
COPY ./build/web/ /usr/share/nginx/html/

# Copy flutter frontend configuration over
COPY nginx.conf /etc/nginx/nginx.conf
