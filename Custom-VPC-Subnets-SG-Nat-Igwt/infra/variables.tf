# variables.tf

variable "aws_profile" {
  description = "AWS profile name."
  default     = "terraform-test"
  type        = string
}

variable "aws_region" {
  description = "AWS region name."
  default     = "ap-south-1"
  type        = string
}

#**********************************************************************************************************

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default     = "myEcsTaskExecutionRole"
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "app_image" {
  type        = string
  description = "Docker image from ECR to deploy on ECS Fargate Cluster."
  default     = "872023895848.dkr.ecr.ap-south-1.amazonaws.com/tf-nodejs-app:latest"
}

variable "app_port" {
  type        = number
  description = "Docker port on ECS Fargate Cluster."
  default     = 80
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 2
}

variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}

