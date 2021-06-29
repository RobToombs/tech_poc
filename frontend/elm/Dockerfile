FROM nginx:latest

# Copy built Elm Site over
COPY ./build/web/* /usr/share/nginx/html

# Copy Elm frontend nginx configuration over
COPY nginx.conf /etc/nginx/nginx.conf