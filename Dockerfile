FROM node:alpine
WORKDIR /usr/src/app
COPY install.sh .
COPY src .
COPY package.json .
RUN chmod +x install.sh \
    ./install.sh
RUN apk --no-cache add exiftool && \
    npm i

EXPOSE 80 443
CMD ["node", "src/index.js"]
