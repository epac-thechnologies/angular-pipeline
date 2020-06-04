FROM node:latest as node
WORKDIR /app
# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH
# install and cache app dependencies
COPY package.json /app/package.json
RUN apt-get autoclean
RUN apt-get autoremove
RUN npm install
RUN npm run build --prod
RUN docker build -t angular-pipeline .

FROM nginx:stable-alpine
COPY dist/angular-pipeline /usr/share/nginx/html
