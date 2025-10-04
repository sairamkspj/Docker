# Stage 1: Build Angular app
FROM node:18 AS build

# Set working directory inside container
WORKDIR /app

# Copy only package.json and package-lock.json for caching
COPY Frontend_Enterprise/delivery-frontend/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of Angular app
COPY Enterprise_application\Frontend_Enterprise\delivery-frontend ./

# Build Angular project for production
RUN npm run build --prod

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy custom Nginx config (optional)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy built Angular files from previous stage
COPY --from=build /app/dist/delivery-frontend /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
