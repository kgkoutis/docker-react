FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# never forget to declare the port with EXPOSE for elasticbeanstalk
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

