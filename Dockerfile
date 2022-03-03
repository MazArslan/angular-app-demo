## Build
FROM node:lts 

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -g @angular/core

RUN npm install -g @angular/cli

RUN npm install -g @angular/core

RUN npm install -g @angular-devkit/build-angular

RUN ng update @angular/cli --force

RUN ng update @angular/core --force

RUN ng update --force

RUN npm update

COPY . .

RUN npm run build

CMD ["ng","serve"]