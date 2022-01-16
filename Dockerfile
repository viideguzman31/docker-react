FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN chmod a+x /usr/src/app/node_modules/.bin/react-scripts
RUN npm install
COPY . .
RUN npm run build
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html