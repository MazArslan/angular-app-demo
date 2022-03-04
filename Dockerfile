# ## Build
# FROM node:lts 

# WORKDIR /app

# COPY . .

# RUN npm install -g @angular/core

# RUN npm install -g @angular/cli

# RUN npm install -g @angular-devkit/build-angular

# # RUN ng update --force

# RUN npm update

# # RUN ng update @angular/cli

# # RUN ng update @angular/core

# RUN npm install

# RUN chmod -R 777 /app

# RUN npm run build --prod

# EXPOSE 4000/tcp

# CMD ["ng","serve"]

FROM redhat/ubi8

RUN yum update -y

RUN yum upgrade -y

RUN dnf module install nodejs:16 -y

WORKDIR /app

# COPY . .  

# RUN npm config set unsafe-perm true

# RUN npm install

# RUN npm install -g @angular/core

RUN npm install -g @angular/cli

# RUN npm install -g @angular-devkit/build-angular

# RUN ng update @angular/cli

# RUN ng update @angular/core

RUN ng new test-app

WORKDIR /app/test-app

RUN mkdir .angular

RUN chmod 775 .angular

EXPOSE 4200/tcp

EXPOSE 80

EXPOSE 8080

CMD ng serve --configuration production --host 172.30.223.242