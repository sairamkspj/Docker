FROM almalinux:9
RUN dnf install nginx -y
RUN rm -rf /usr/share/nginx/html/index.html
COPY New.html /usr/share/nginx/html/index.html
#The daemon off directive in Nginx configures it to run in the foreground instead of as a background process,
CMD ["nginx", "-g", "daemon off;"] 
#divS