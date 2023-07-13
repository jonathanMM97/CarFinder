FROM node:20.4.0-alpine AS build
WORKDIR /app

COPY package.json package-lock.json ./
# COPY .env ./
RUN npm ci

COPY public/ public/
COPY src/ src/
RUN npm run build
RUN npm install -g serve

# Uses port which is used by the actual application
EXPOSE 5173
# Run application
##CMD [ "npm", "start" ]
CMD serve -s -n build
