#!/bin/bash
set -e

# Definir credenciales de MongoDB (se reemplazarán en Terraform)
MONGO_USER="MY_USER"
MONGO_PASSWORD="MY_PASSWORD"
MONGO_IP="MONGO_IP"

# sudo chmod 755 /home/ubuntu
# sudo chmod 755 /home/ubuntu/mean-stack-example
# sudo chmod 755 /home/ubuntu/mean-stack-example/client
# sudo chmod 755 /home/ubuntu/mean-stack-example/client/dist
# sudo chmod 755 /home/ubuntu/mean-stack-example/client/dist/client

# Reemplazar valores en el archivo .env del backend
cd /home/ubuntu/mean-stack-example/server
cp .env.example .env
#sed -i "s|mongodb+srv://<username>:<password>@sandbox.jadwj.mongodb.net/meanStackExample?retryWrites=true&w=majority|mongodb://$MONGO_USER:$MONGO_PASSWORD@$MONGO_IP:27017/meanStackExample?authSource=admin|" .env
#sed -i "s|ATLAS_URI="mongodb://adminuser:StrongPassword123@MONGOIP:27017/meanStackExample?authSource=admin"|mongodb://adminuser:StrongPassword123@44.201.198.70:27017/meanStackExample?authSource=admin|" .env
