output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID de la subred pública"
  value = aws_subnet.public_subnet.id
}

output "secondary_public_subnet_id" {
  description = "ID de la subred pública"
  value = aws_subnet.secondary_public_subnet.id
}

output "private_subnet_id" {
  description = "ID de la subred privada"
  value = aws_subnet.private_subnet.id
}