## Build
FROM ubi8/nodejs-12 

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -g @angular/cli

RUN npm install

COPY . .

RUN npm run build

CMD ["npm","start"]