# Getting Nginx official image
FROM nginx:latest

# Copy website files to the nginx HTML directory
COPY . /usr/share/nginx/html

# Expose port 99 for the website
EXPOSE 99

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
