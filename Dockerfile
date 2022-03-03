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

COPY . .  

RUN npm config set unsafe-perm true

RUN npm install

RUN npm install -g @angular/core

RUN npm install -g @angular/cli

RUN npm install -g @angular-devkit/build-angular

# RUN ng update @angular/cli

# RUN ng update @angular/core

CMD tail -f /dev/null