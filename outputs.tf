# outputs.tf
output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_id" {
  description = "ID de la subred pública"
  value = module.network.public_subnet_id
}

output "secondary_public_subnet_id" {
  description = "ID de la subred pública"
  value = module.network.secondary_public_subnet_id
}

output "private_subnet_id" {
  description = "ID de la subred privada"
  value = module.network.private_subnet_id
}

output "mean_sg_id" {
  value = module.security.mean_sg_id  # ID del grupo de seguridad MEAN
}

output "mongodb_sg_id" {
  value = module.security.mongodb_sg_id  # ID del grupo de seguridad MongoDB
}

output "mean_public_ip" {
  value = module.instances.mean_public_ip
}

output "mean_private_ip" {
  value = module.instances.mean_private_ip
}

output "mongo_public_ip" {
  value = module.instances.mongo_public_ip
}

output "mongo_private_ip" {
  value = module.instances.mongo_private_ip
}

output "mean_lb_arn" {
  value = module.load_balancer.mean_lb_arn
  description = "ARN del Load Balancer"
}

output "mean_lb_dns_name" {
  value = module.load_balancer.mean_lb_dns_name
  description = "DNS del Load Balancer"
}

# output "mean_target_group_arn" {
#   value = module.load_balancer.mean_target_group.arn
#   description = "ARN del Target Group"
# }

# output "mean_listener_arn" {
#   value = module.load_balancer.mean_lb_listener.arn
#   description = "ARN del Listener"
# }
