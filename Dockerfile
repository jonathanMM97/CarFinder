FROM node:20.4.0-alpine AS build
WORKDIR /app

COPY package.json package-lock.json ./
# COPY .env ./
RUN npm ci

COPY . /app/
#COPY public/ public/
#COPY src/ src/
RUN npm run build
#RUN npm preview

# Uses port which is used by the actual application
EXPOSE 3000
# Run application
CMD [ "npm", "run", "preview" ]
#CMD serve -s -n build
