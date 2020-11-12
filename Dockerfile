FROM node:alpine
COPY . 
RUN chmod +x install.sh \
    ./install.sh
WORKDIR /usr/src/app
COPY src .
COPY package.json .

RUN apk --no-cache add exiftool && \
    npm i

EXPOSE 80 443
CMD ["node", "src/index.js"]
