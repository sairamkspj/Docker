# Stage 1: Build Angular
FROM node:18 AS build
WORKDIR /app

# Copy package.json & package-lock.json
COPY package*.json ./
RUN npm install

# Copy Angular source
COPY . ./

# Build Angular for production
RUN npm run build --prod

# Stage 2: Nginx
FROM nginx:alpine

# Copy nginx config from Dockerfile folder
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy Angular build
COPY --from=build /app/dist/delivery-frontend /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
