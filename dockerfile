FROM node:14
WORKDIR /usr/src/app
COPY package*.json ./
COPY . .
EXPOSE 80
CMD [ "npm", "start" ]
