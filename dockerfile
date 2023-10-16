# Stage 1: Build the React application
FROM node:14 AS build

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm install --force
COPY . .
RUN npm run build

# Stage 2: Create a lightweight production image
FROM nginx:alpine

COPY --from=build /usr/src/app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

