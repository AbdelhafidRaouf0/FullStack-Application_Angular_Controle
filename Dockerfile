FROM node:18.17.0 AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
