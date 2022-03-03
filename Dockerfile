## Build
FROM node:lts 

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -g @angular/core

RUN npm install -g @angular/cli

RUN npm install

RUN ng update @angular/cli --force

RUN ng update @angular/core --foce

RUN ng update --force

RUN npm update

COPY . .

RUN npm run build

CMD ["ng","serve"]