#!/bin/bash
set -e

# Actualizar paquetes e instalar dependencias
sudo apt update -y

# Agregar la clave y repositorio oficial de MongoDB
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo tee /etc/apt/trusted.gpg.d/mongodb-server-6.0.asc
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Instalar MongoDB
sudo apt update -y
sudo apt install -y mongodb-org

# Iniciar y habilitar MongoDB
sudo systemctl enable mongod
sudo systemctl start mongod

# Verificar que MongoDB está corriendo
sudo systemctl status mongod --no-pager
