# modules/load_balancer/variables.tf

variable "mean_sg_id" {
  description = "The Security Group ID of the MEAN instances."
  type        = string
}

variable "public_subnet" {
  description = "The ID of the public subnet for the Load Balancer."
  type        = string
}

variable "secondary_public_subnet" {
  description = "The ID of the public subnet for the Load Balancer."
  type        = string
}

variable "mean_instance_id" {
  description = "The ID of the MEAN stack instance."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}