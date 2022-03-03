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

RUN yum update

RUN yum upgrade

RUN yum install node

WORKDIR /usr

COPY . .  

CMD ['sh']