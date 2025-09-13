variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "alb_name" {
  description = "Name for the Application Load Balancer"
  type        = string
}

variable "alb_sg_id" {
  description = "Security group ID for ALB"
  type        = string
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
}
