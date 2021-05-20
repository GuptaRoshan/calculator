FROM node:14 AS Builder

ENV NPM_CONFIG_LOGLEVEL info

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . .

ARG GENERATE_SOURCEMAP=false

RUN npm install && npm build

FROM nginx:1.13.3-alpine

RUN rm -rf /usr/share/nginx/html/*
COPY --from=Builder /usr/src/app/public /usr/share/nginx/html
COPY --from=Builder /usr/src/app/nginx/nginx.conf /etc/nginx/
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]