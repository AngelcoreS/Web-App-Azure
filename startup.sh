#!/bin/bash
# Copy custom Nginx config to /etc/nginx
cp /home/Web-App-Azure/default /etc/nginx/sites-available/default
# Restart Nginx service
service nginx restart
