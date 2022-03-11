FROM yobasystems/alpine-nginx:latest

ENV NODE_VERSION=v10.15.3 NPM_VERSION=6.4.1

RUN echo "http://dl-4.alpinelinux.org/alpine/v3.15/main" >> /etc/apk/repositories && \
    echo "alias python=python3" >> ~/.bashrc && \
    apk add --update git curl make python3 gcc g++ linux-headers libgcc libstdc++ binutils-gold && \
    curl -sSL https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}.tar.gz | tar -xz && \
    npm install -g npm@${NPM_VERSION} && \
    cd /node-${NODE_VERSION} && \
    ./configure --prefix=/usr --without-snapshot && \
    make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
    make install && \
    cd / && \
    apk del gcc g++ linux-headers binutils-gold && \
    rm -rf /etc/ssl /node-${NODE_VERSION} /usr/include \
    /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html

