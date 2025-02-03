output "mean_lb_arn" {
  value = aws_lb.mean_lb.arn
  description = "ARN del Load Balancer"
}

output "mean_lb_dns_name" {
  value = aws_lb.mean_lb.dns_name
  description = "DNS del Load Balancer"
}

# output "mean_target_group_arn" {
#   value = aws_lb_target_group.mean_target_group.arn
#   description = "ARN del Target Group"
# }

# output "mean_listener_arn" {
#   value = aws_lb_listener.mean_lb_listener.arn
#   description = "ARN del Listener"
# }
