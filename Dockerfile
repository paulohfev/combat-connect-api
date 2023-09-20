FROM node:18-alpine as development

ARG NODE_ENV
ENV NODE_ENV=${NODE_ENV}

WORKDIR /app
COPY package.json .
COPY package-lock.json .
COPY . .

# Conditionally set the CMD based on NODE_ENV
CMD ["sh", "-c", "if [ \"$NODE_ENV\" = \"development\" ]; then npm run start:dev; else npm start; fi"]
