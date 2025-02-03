#!/bin/bash
set -e

# Permitir tráfico en el puerto 27017 SOLO desde la AMI de MEAN
sudo ufw allow 27017
