# Use a lightweight web server
FROM nginx:alpine

# Copy HTML file to the web server's default directory
COPY index.html /usr/share/nginx/html

# Expose port 80 for NGINX
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
