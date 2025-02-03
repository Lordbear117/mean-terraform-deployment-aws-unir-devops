# IP pública y privada del frontend (MEAN Stack)
output "mean_public_ip" {
  description = "Public IP of the MEAN stack instance"
  value       = aws_instance.mean_instance.public_ip
}

output "mean_private_ip" {
  description = "Private IP of the MEAN stack instance"
  value       = aws_instance.mean_instance.private_ip
}

# IP pública y privada del backend (MongoDB)
output "mongo_public_ip" {
  description = "Public IP of the MongoDB instance (should be null if private)"
  value       = aws_instance.mongo_instance.public_ip
}

output "mongo_private_ip" {
  description = "Private IP of the MongoDB instance"
  value       = aws_instance.mongo_instance.private_ip
}

output "mean_instance_id" {
  value = aws_instance.mean_instance.id
  description = "El ID de la instancia del stack MEAN"
}