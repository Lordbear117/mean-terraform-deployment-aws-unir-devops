#!/bin/bash
set -e

# Instalar PM2 para manejar procesos de Node.js
sudo npm install -g pm2

# Iniciar backend con PM2
cd /home/ubuntu/mean-stack-example/server
pm2 start npm --name backend -- start

# Guardar procesos para que inicien automáticamente
sudo env PATH=$PATH:/usr/bin /usr/local/lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu
pm2 save
