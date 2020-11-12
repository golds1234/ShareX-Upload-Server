FROM node:alpine

WORKDIR /usr/src/app
COPY src .
COPY package.json .

RUN apk --no-cache add exiftool && \
    npm i

EXPOSE 80 443
CMD ["node", "index.js"]
CMD ["bash","install.sh"]

RUN -v $(pwd)/src/config.json:/usr/src/app/config.json \
    -v $(pwd)/src/db.json:/usr/src/app/db.json \
    -v $(pwd)/src/server/uploads/:/usr/src/app/server/uploads/ \
    -p 8000:80 -p 8443:443 \
    sharex-upload-server
