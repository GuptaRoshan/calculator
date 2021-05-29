FROM node:14 AS Builder

ENV NPM_CONFIG_LOGLEVEL info

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . .

ARG GENERATE_SOURCEMAP=false

RUN npm install && npm build

EXPOSE 3000

CMD ["npm", "start"]
