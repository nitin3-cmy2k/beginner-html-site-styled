FROM nginx
RUN apt-get update -y
COPY index.html /var/www/html/index.html
COPY styles/style.css /var/www/html/style.css
EXPOSE 82:80

