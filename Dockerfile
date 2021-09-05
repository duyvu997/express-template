# syntax=docker/dockerfile:1

FROM node:lts-alpine3.14

ENV NODE_ENV=production \
    PORT=3000

WORKDIR /app

COPY ["package.json", "yarn.lock", "./"]

RUN yarn install --production

COPY . .

CMD [ "node", "./server.js" ]
