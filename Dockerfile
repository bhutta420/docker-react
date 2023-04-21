# base image
FROM node:14-alpine as builder
# install process
WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
# command
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html