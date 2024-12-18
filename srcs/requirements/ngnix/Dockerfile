FROM alpine:3.19.4

# Install Nginx and OpenSSL
RUN apk update && apk upgrade
RUN apk add nginx openssl

# Create directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Generate a self-signed SSL certificate
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/evocatur.crt \
    -keyout /etc/nginx/ssl/evocatur.key \
    -subj "/C=IT/ST=Rome/L=Rome/O=42 Roma Luiss/OU=evocatur/CN=evocatur"

# Copy the default server configuration
COPY ./conf/default.conf /etc/nginx/http.d/default.conf

# Create required directories
RUN mkdir -p /run/nginx

# Expose HTTPS port
EXPOSE 443 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
