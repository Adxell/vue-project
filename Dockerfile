# stage1 as builder
FROM node:16.18-alpine3.15 as builder

WORKDIR /vue-ui

# Copy the package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the files
COPY . .

# Build the project
RUN npm run build


FROM nginx:1.23.2-alpine as production-build
COPY ./.nginx/nginx.conf /etc/nginx/nginx.conf

## Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy from the stahg 1
COPY --from=builder /vue-ui/dist /usr/share/nginx/html

EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]