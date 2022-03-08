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

RUN npm install -g @angular/cli

COPY . .  

RUN npm install

RUN mkdir .angular

RUN chmod 775 .angular

EXPOSE 4200/tcp

RUN cat /etc/hosts 

RUN echo $(tail -1 /etc/hosts)

CMD ng serve --configuration production --public-host $(tail -1 /etc/hosts | grep -o '^\S*') --host $(tail -1 /etc/hosts | grep -o '^\S*') --port 4200