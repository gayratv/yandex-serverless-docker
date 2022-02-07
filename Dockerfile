# specify the node base image with your desired version node:<version>
FROM node:16-alpine
ENV NPM_CONFIG_LOGLEVEL info

# создание директории приложения
WORKDIR /usr/src/app

# установка зависимостей
# символ астериск ("*") используется для того чтобы по возможности
# скопировать оба файла: package.json и package-lock.json
COPY ./dist/*.* ./

# Если вы создаете сборку для продакшн
# RUN npm ci --only=production

RUN npm install

# node-gyp alpine
#RUN apk add --no-cache --virtual .gyp python3 make g++ \
#    && npm install \
#    && apk del .gyp \

# COPY dist/index.js dist/app.js
EXPOSE 8080
# At the end, set the user to use when running this image
USER node
CMD ["node", "index.js"]



