resource "aws_lb" "mean_lb" {
  name               = "mean-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.mean_sg_id]
  subnets            = [var.public_subnet, var.secondary_public_subnet]

  enable_deletion_protection = false

  tags = {
    Name = "MeanLoadBalancer"
  }
}

resource "aws_lb_target_group" "mean_target_group" {
  name     = "mean-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path = "/api/employees"
    port = 80
  }

}

resource "aws_lb_listener" "mean_lb_listener" {
  load_balancer_arn = aws_lb.mean_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mean_target_group.arn  # Redirige al Target Group
  }
}

resource "aws_lb_target_group_attachment" "mean_target_attachment" {
  target_group_arn = aws_lb_target_group.mean_target_group.arn
  target_id        = var.mean_instance_id
  port             = 80
}
