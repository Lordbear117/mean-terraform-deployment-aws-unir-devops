# Output de los security groups
output "mean_sg_id" {
  value = aws_security_group.mean_sg.id
}

output "mongodb_sg_id" {
  value = aws_security_group.mongodb_sg.id
}