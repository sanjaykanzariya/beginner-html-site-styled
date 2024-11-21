# Use an official Nginx image from DockerHub latest
FROM nginx:alpine

# Copy the content of your website (current directory) into the Nginx HTML directory
COPY . /usr/share/nginx/html

# Expose port 80 so the website is accessible
EXPOSE 80
