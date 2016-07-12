FROM node:latest

ADD . /usr/src/cheeky-api

RUN cd /usr/src/cheeky-api && npm install

WORKDIR /usr/src/cheeky-api

CMD ["node", "server.js"]

EXPOSE 80
