FROM yobasystems/alpine-nginx:latest

ENV NODE_VERSION=v10.15.3 NPM_VERSION=6.4.1



FROM mhart/alpine-node:10.24 as node

RUN npm -v


COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/share /usr/local/share
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin


RUN echo "http://dl-4.alpinelinux.org/alpine/v3.15/main" >> /etc/apk/repositories && \
    apk add --update git curl make python2 gcc g++ linux-headers libgcc libstdc++ binutils-gold && \
    cd / && \
    npm cache clean -f && \
    npm uninstall -g npm && \
    npm install -g npm@${NPM_VERSION} && \
    sudo n latest && \
    apk del gcc g++ linux-headers binutils-gold && \
    rm -rf /etc/ssl /node-${NODE_VERSION} /usr/include \
    /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html
