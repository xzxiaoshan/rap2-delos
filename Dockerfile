FROM alpine/git:latest
MAINTAINER xzxiaoshan <365384722@qq.com>

WORKDIR /gitcode/

RUN set -x && \
    git clone https://github.com/thx/rap2-delos.git && \
    \cp -rf rap2-delos/src/config/config.prod.ts rap2-delos/src/config/config.dev.ts

FROM node:8.11.1-alpine

WORKDIR /app/rap2-delos

COPY --from=0 /gitcode/rap2-delos/ .

RUN set -x && \
    npm install && \
    npm install -g typescript && \
    npm install pm2 && \
    npm run build

EXPOSE 8080

CMD npm start && tail
