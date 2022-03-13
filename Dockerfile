FROM scribay/alpine-nginx-nodejs:1.0.0

RUN echo "http://dl-4.alpinelinux.org/alpine/v3.15/main" >> /etc/apk/repositories && \
    apk add --update nginx
