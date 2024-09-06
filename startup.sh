#!/bin/bash
# Copy custom Nginx config to /etc/nginx
cp /home/site/wwwroot/custom-nginx.conf /etc/nginx/nginx.conf
# Restart Nginx service
service nginx restart