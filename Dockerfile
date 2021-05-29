FROM node:14 AS Builder

ENV NPM_CONFIG_LOGLEVEL info

ENV PORT 8080

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . .

ARG GENERATE_SOURCEMAP=false

RUN npm install && npm build

EXPOSE 8080

CMD ["npm", "start"]
