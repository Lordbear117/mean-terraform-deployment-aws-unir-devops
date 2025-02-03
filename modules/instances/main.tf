# ----------------------------
# Máquina Virtual para BD (MongoDB)
# ----------------------------
resource "aws_instance" "mongo_instance" {
  ami                         = var.ami_mongo_id
  instance_type               = "t2.micro"
  key_name                    = "packer"
  subnet_id                   = var.private_subnet
  security_groups             = [var.mongo_sg_id]
  associate_public_ip_address = false

  tags = {
    Name = "MongoInstance"
  }
}

# ----------------------------
# Máquina Virtual para stack MEAN (Anuglar, Express, Node.js)
# ----------------------------
  #  No necesario mover al final  "cd /home/ubuntu/mean-stack-example/server",
  #  No necesario "pm2 delete backend",
  #  No necesario mover al final  "pm2 start npm --name backend -- start",
resource "aws_instance" "mean_instance" {
  ami                         = var.ami_mean_id
  instance_type               = "t2.medium"
  key_name                    = "packer"
  subnet_id                   = var.public_subnet
  security_groups             = [var.mean_sg_id]
  associate_public_ip_address = true

  tags = {
    Name = "MeanInstance"
  }
  # Provisioner para modificar ambos archivos .env y environment.ts
  provisioner "remote-exec" {
    inline = [
      # Reemplazar MONGOIP con la IP privada de MongoDB en el archivo .env
      "sed -i 's|MONGOIP|${aws_instance.mongo_instance.private_ip}|g' /home/ubuntu/mean-stack-example/server/.env",

      # Reemplazar la URL del backend en el archivo environment.ts
      "sed -i 's|http://localhost:5200|http://${self.public_ip}/api|' /home/ubuntu/mean-stack-example/client/src/enviroments/enviroments.ts",

      # Instalar dependencias
      "cd /home/ubuntu/mean-stack-example/client && npm install",

      # Compilar el frontend
      "timeout 45 npm run build --prod || true",

      "sudo chmod 755 /home/ubuntu",
      "sudo chmod 755 /home/ubuntu/mean-stack-example",
      "sudo chmod 755 /home/ubuntu/mean-stack-example/client",
      "sudo chmod 755 /home/ubuntu/mean-stack-example/client/dist",
      "sudo chmod 755 /home/ubuntu/mean-stack-example/client/dist/client",

      "sudo systemctl restart nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("C:\\Users\\black\\Downloads\\packer\\packer.pem") # Ruta a tu clave privada
      host        = self.public_ip
    }
  }
}
