# Use Node.js image for build
FROM node:16 AS build

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy app source code and build the app
COPY . .
RUN npm run build

# Use a lightweight web server for serving the built app
FROM nginx:alpine

# Copy build output to Nginx default HTML directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 3000
EXPOSE 3000

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
