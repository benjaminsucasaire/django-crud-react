# syntax=docker/dockerfile:1.4
FROM node:16.14.0 AS development

ENV CI=true
EXPOSE 3000

WORKDIR /code
COPY package.json /code/package.json
COPY package-lock.json /code/package-lock.json
RUN npm install
COPY . /code

# Serve the app
CMD ["npm", "run", "dev"]