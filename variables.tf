variable "owner" {
  description = "Name of the resources owner"
  type        = string
  default     = "example"
}

variable "project_name" {
  description = "Resources project tag"
  type        = string
  default     = "gitlab"
}

variable "name_prefix" {
  description = "Default prefix for resources name tag"
  type        = string
  default     = "gitlab"
}

variable "region" {
  description = "AWS region resources are launched in"
  type        = string
  default     = "eu-north-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "172.16.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet. Must be in VPC range"
  type        = string
  default     = "172.16.1.0/24"
}

variable "host_private_ip" {
  description = "Gitlab host instance private IP. Must be in subnet range and different from runner IP"
  type        = string
  default     = "172.16.1.1"
}

variable "runner_private_ip" {
  description = "Gitlab runner instance private IP. Must be in subnet range and different from host IP"
  type        = string
  default     = "172.16.1.2"
}

variable "host_instance_type" {
  description = "Gitlab host instance class"
  type        = string
  default     = "t3a.medium"
}

variable "runner_instance_type" {
  description = "Gitlab runner instance class"
  type        = string
  default     = "t3a.medium"
}


variable "ssh_authorized_cidr_blocks" {
  description = "List of cidr that are authorized to access the instances via SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "https_authorized_cidr_blocks" {
  description = "List of cidr that are authorized to access the instances via HTTPS"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}