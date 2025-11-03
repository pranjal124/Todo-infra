
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = "todo-terraform-pranjal"
    key            = "todo-infra/terraform.tfstate"
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["taskapp-vpc"]
  }
}
module "ecs" {
  source = "./modules/ecs"

  vpc_id                = data.aws_vpc.selected.id
  ecs_cluster_name      = var.ecs_cluster_name
  ecs_task_family       = var.ecs_task_family
  ecs_task_cpu          = var.ecs_task_cpu
  ecs_task_memory       = var.ecs_task_memory
  container_name        = var.container_name
  container_image       = var.container_image
  container_port        = var.container_port
  ecs_service_name      = var.ecs_service_name
  ecs_service_desired_count = var.ecs_service_desired_count
  security_group_id     = var.ecs_service_sg_id
  alb_target_group_arn  = module.alb.target_group_arn
}

module "alb" {
  source = "./modules/alb"

  vpc_id             = data.aws_vpc.selected.id
  alb_name           = var.alb_name
  alb_sg_id          = var.alb_sg_id
  container_port     = var.container_port
}



