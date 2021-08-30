FROM nginx:latest

# Copy built vue site over
COPY ./dist /usr/share/nginx/html/

# Copy vue frontend configuration over
COPY nginx.conf /etc/nginx/nginx.conf
