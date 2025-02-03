variable "ami_mean_id" {
  description = "AMI ID for MEAN stack instance"
  type        = string
}

variable "ami_mongo_id" {
  description = "AMI ID for MongoDB instance"
  type        = string
}

variable "public_subnet" {
  description = "ID of the public subnet for frontend"
  type        = string
}

variable "private_subnet" {
  description = "ID of the private subnet for MongoDB"
  type        = string
}

variable "mean_sg_id" {
  description = "Security Group ID for MEAN stack instance"
  type        = string
}

variable "mongo_sg_id" {
  description = "Security Group ID for MongoDB instance"
  type        = string
}