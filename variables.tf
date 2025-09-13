variable "ecs_cluster_name" {
  description = "ECS Cluster name"
  type        = string
  default     = "todo-ecs-cluster"
}

variable "ecs_task_family" {
  description = "ECS Task Definition family"
  type        = string
  default     = "todo-task-family"
}

variable "ecs_task_cpu" {
  description = "CPU units for the task"
  type        = string
  default     = "256"
}

variable "ecs_task_memory" {
  description = "Memory (MiB) for the task"
  type        = string
  default     = "512"
}

variable "container_name" {
  description = "Container name"
  type        = string
  default     = "todo-app"
}

variable "container_image" {
  description = "Container image URI"
  type        = string
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 5000
}

variable "ecs_service_name" {
  description = "ECS Service name"
  type        = string
  default     = "todo-ecs-service"
}

variable "ecs_service_desired_count" {
  description = "Number of desired tasks"
  type        = number
  default     = 1
}

variable "ecs_service_sg_id" {
  description = "Security group ID for ECS service"
  type        = string
}

variable "alb_name" {
  description = "Name for the Application Load Balancer"
  type        = string
  default     = "todo-alb"
}

variable "alb_sg_id" {
  description = "Security group ID for ALB"
  type        = string
}

variable "vpc_name" {
  description = "Name tag of the VPC"
  type        = string
  default     = "taskapp-vpc"
}
