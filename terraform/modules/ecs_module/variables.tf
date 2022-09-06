variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "app_name" {
  type        = string
  description = "Application name"
}

variable "app_environment" {
  type        = string
  description = "Application environment"
}

variable "aws_key_pair_name" {
  type        = string
  description = "AWS key pair name"
}

variable "admin_sources_cidr" {
  type        = list(string)
  description = "List of IPv4 CIDR blocks"
}

variable "app_sources_cidr" {
  type        = list(string)
  description = "List of IPv4 CIDR blocks"
}

variable "type_instance" {
  type        = string
  description = "EC2 instance type"
}

variable "type_instance_count" {
  type        = string
  description = "Number of EC2 instances"
}

variable "nginx_test_name" {
  description = "Name of Application"
}

variable "nginx_image" {
  description = "Docker image to run in the ECS cluster"
}

variable "nginx_port" {
  description = "Port exposed by the Docker image to redirect traffic to"
}

variable "nginx_count" {
  description = "Number of Docker containers to run"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
}

variable "vpc_cidr" {
  description = "Fargate instance memory to provision (in MiB)"
  type        = string
}

variable "krusty_port" {
  description = "Port alb"
  type        = string
}

variable "krusty_environment" {
  description = "env"
  type        = string
}
