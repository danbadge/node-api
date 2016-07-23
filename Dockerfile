FROM node:latest

RUN mkdir -p /usr/src/node-api
WORKDIR /usr/src/node-api

ADD . /usr/src/node-api

RUN npm install

CMD ["node", "server.js"]

EXPOSE 3000
