#!/bin/bash
set -e

# Actualizar paquetes e instalar dependencias
sudo apt update -y
sudo apt install -y nginx nodejs npm git

# Clonar el repositorio de la aplicación MEAN
cd /home/ubuntu
git clone https://github.com/Lordbear117/mean-stack-example.git

# Instalar dependencias del backend
cd /home/ubuntu/mean-stack-example/server
npm install

# Instalar dependencias del frontend
#cd /home/ubuntu/mean-stack-example/client

# Crear el archivo de configuración de Angular CLI para desactivar la telemetría
# mkdir -p ~/.client
# echo '{ "cli": { "analytics": false } }' > ~/.client/config.json

# npm install
# npx ng analytics off
# NODE_OPTIONS="--max-old-space-size=512" npm run build --prod --no-progress --no-watch  # Generar la versión de producción

# Configurar Nginx para servir el frontend
sudo tee /etc/nginx/sites-available/default > /dev/null <<EOF
server {
    listen 80;
    server_name _;

    root /home/ubuntu/mean-stack-example/client/dist/client/browser;
    index index.html;

    location / {
        try_files \$uri /index.html;
    }

    # Evitar que favicon.ico se redirija
    location = /favicon.ico {
        log_not_found off;
        access_log off;
    }

    location /api/ {
        proxy_pass http://localhost:5200/;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;

        # Asegurarse de agregar los headers de CORS
        add_header Access-Control-Allow-Origin *;
        add_header Access-Control-Allow-Methods "GET, POST, OPTIONS, DELETE, PUT";
        add_header Access-Control-Allow-Headers "Content-Type, Authorization";

    }
}
EOF

# Reiniciar Nginx
#sudo systemctl restart nginx
