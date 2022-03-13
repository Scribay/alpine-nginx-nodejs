FROM scribay/alpine-nginx-nodejs:1.0.0

RUN nginx -v

RUN apk upgrade nginx=1.20.2-r0 --allow-untrusted --repository=http://dl-4.alpinelinux.org/alpine/v3.15/main

RUN nginx -v
