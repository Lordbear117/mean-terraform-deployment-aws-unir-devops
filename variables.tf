# variables.tf
variable "aws_region" {
  description = "AWS region where the resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  # default     = "10.0.0.0/16"
}

variable "ami_mean_stack_id" {
  description = "AMI ID for the EC2 instances with the mean stack"
  type        = string
}

variable "ami_mongodb_id" {
  description = "AMI ID for the EC2 instances with mongodb database"
  type        = string
}