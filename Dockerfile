FROM node:4.4.7

RUN npm install -g npm@3
RUN npm install -g bower forever@0.14.2 gulp

ENV TERM xterm

EXPOSE 3000

RUN apt-get update -qy                        && \
    apt-get install -qy graphicsmagick        && \
    apt-get autoremove -qy                                      && \
    apt-get clean                                               && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/* /tmp/* /var/tmp/*

COPY package.json /usr/src/
WORKDIR /usr/src
RUN npm install

COPY /*.js /usr/src/
COPY /lib /usr/src/lib

CMD ["forever", "./image-server.js"]

# Uncomment the line below to be able to restart in prod
# CMD ["tail", "-f", "/etc/hosts"]
