FROM node:alpine

WORKDIR /usr/src/app
COPY src .
COPY package.json .

RUN apk --no-cache add exiftool && \
    npm i

EXPOSE 80 443
CMD ["node", "index.js"]
RUN chmod 777 install.sh
CMD ["bash","install.sh"]
