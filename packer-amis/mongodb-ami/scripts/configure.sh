#!/bin/bash
set -e

# Asegurar que MongoDB está en el PATH
export PATH=/usr/bin:$PATH

# Esperar a que MongoDB inicie
sleep 10

# Definir usuario y contraseña
MONGO_USER="adminuser"
MONGO_PASSWORD="StrongPassword123"

# Crear usuario administrador en MongoDB
# mongosh --eval "
# use admin;
# db.createUser({
#   user: '$MONGO_USER',
#   pwd: '$MONGO_PASSWORD',
#   roles: [{ role: 'root', db: 'admin' }]
# });
# "

# mongosh --eval '
# use admin;
# db.createUser({
#   user: "adminuser",
#   pwd: "StrongPassword123",
#   roles: [{ role: "root", db: "admin" }]
# });
# '

# Crear usuario administrador en MongoDB
mongosh --eval 'db.getSiblingDB("admin").createUser({user: "adminuser", pwd: "StrongPassword123", roles: [{ role: "root", db: "admin" }]});'

# Habilitar autenticación en MongoDB
sudo sed -i '/#security:/a security:\n  authorization: enabled' /etc/mongod.conf

# Modificar /etc/mongod.conf para permitir conexiones remotas
sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf

# Reiniciar MongoDB para aplicar la configuración
sudo systemctl restart mongod
