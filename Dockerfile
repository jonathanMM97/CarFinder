FROM node:20.4.0-alpine

RUN npm install -g http-server

RUN mkdir /app
WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 8081

CMD ["http-server", "dist"]

#
# # COPY .env ./
# RUN npm install -g http-server
#
# COPY package.json package-lock.json ./
#
# RUN npm install
#
# COPY . /app/
# #COPY public/ public/
# #COPY src/ src/
# RUN npm run build
#
# # Uses port which is used by the actual application
# EXPOSE 3000
# # Run application
# CMD [ "http-server", "dist" ]
# #CMD serve -s -n build
