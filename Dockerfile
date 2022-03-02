## Build
FROM node:lts 

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -g @angular/core

RUN npm install -g @angular/cli

RUN npm install

RUN ng update

RUN npm update

COPY . .

RUN npm run build

CMD ["npm","start"]