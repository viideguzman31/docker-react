FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install react-scripts --save
COPY . .
RUN npm run build

FROM nginx 
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

