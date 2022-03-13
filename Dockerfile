FROM scribay/alpine-nginx-nodejs:1.0.0

RUN apk add --no-cache nginx=1.20.2-r0 --allow-untrusted --repository=http://dl-4.alpinelinux.org/alpine/v3.15/main && \
    rm -rf /var/cache/apk/* && \
    chown -R nginx:www-data /var/lib/nginx

# Add the files
ADD root /

# Expose the ports for nginx
EXPOSE 80 443
