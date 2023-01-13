#!/usr/bin/env bash
# Bash script that sets up your web servers for the deployment of web_static

ADD_WEBSTATIC="\\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n"

apt-get update
apt-get install -y nginx

mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/
echo "Holberton School" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current

chown -R ubuntu /data/
chgrp -R ubuntu /data/

sudo sed -i "35i $ADD_WEBSTATIC" /etc/nginx/sites-available/default

service nginx restart
