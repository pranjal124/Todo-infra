variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "ecs_cluster_name" {
  description = "ECS Cluster name"
  type        = string
}

variable "ecs_task_family" {
  description = "ECS Task Definition family"
  type        = string
}

variable "ecs_task_cpu" {
  description = "CPU units for the task"
  type        = string
}

variable "ecs_task_memory" {
  description = "Memory (MiB) for the task"
  type        = string
}

variable "container_name" {
  description = "Container name"
  type        = string
}

variable "container_image" {
  description = "Container image URI"
  type        = string
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
}

variable "ecs_service_name" {
  description = "ECS Service name"
  type        = string
}

variable "ecs_service_desired_count" {
  description = "Number of desired tasks"
  type        = number
}

variable "security_group_id" {
  description = "Security group ID for ECS service"
  type        = string
}

variable "alb_target_group_arn" {
  description = "Target group ARN for ALB"
  type        = string
}
