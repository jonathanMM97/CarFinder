FROM node:20.4.0-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install vite --save-dev

COPY . .

RUN npm run build

EXPOSE 5173

# Run application
CMD [ "npm", "run", "dev" ]

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
